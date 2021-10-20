require 'open-uri'
require 'nokogiri'
require 'csv'

task :scrapping do
  fish_csv = CSV.open("catches.csv", "wb", col_sep: "|")
  baits_csv = CSV.open("baits.csv", "wb", col_sep: "|")
  bait_catches_csv = CSV.open("bait_catches.csv", "wb", col_sep: "|")

  # hash having all baits
  table = CSV.parse(File.read("./stopwords.csv")).flatten
  BAITS_URL = 'https://pescadordeportivo.net/2013/03/19/que-carnada-usar-para-cada-pez/'
  all_baits_fish = {}
  all_baits = []
  html_content_baits = URI.open(BAITS_URL).read
  doc_baits = Nokogiri::HTML(html_content_baits)

  doc_baits.search('.entry').search('ul').each do |list|
    list.search('li').each do |baits|
      baits_clean = baits.text.strip.gsub(/[\t\r\n‘“”’\… ]/, "")
      if baits.search('a').empty? && baits_clean != "" && baits_clean.split(":")[0] != "Pejerrey"
        pez = baits_clean.split(":")[0].strip
        baits_ultra_clean = baits_clean.split(":")[1].strip.split(".")[0].split("(")[0]
                                       .split(/[,\s\d]/).reject(&:empty?)
                                       .map { |element| element.strip.downcase }
                                       .reject { |word| table.include? word.downcase }
        carnada = baits_ultra_clean
        all_baits_fish[pez] = carnada
        all_baits.concat(carnada)
      end
    end
  end
  all_baits.uniq!
  all_baits.each_with_index do |name,index|
    per_statement = ["dozen", "bag", "kilogram"]
    baits_csv << [index + 1, "#{rand(5)+1} dollars per #{per_statement.sample}", name, "best bait to fish"]
  end

  URL ='https://biodiversidadacuatica.imarpe.gob.pe/Catalogo/Grupos_Biologicos?id=127'
  URL_IMAGES = "https://biodiversidadacuatica.imarpe.gob.pe"
  URL_FISH = 'https://biodiversidadacuatica.imarpe.gob.pe/Catalogo/Especie?id='
  URL_FISH_BASE = 'https://www.fishbase.de/summary/'
  # transforming python's csv
  # Scrapping
  html_content = URI.open(URL).read
  doc = Nokogiri::HTML(html_content)

  cont = 1
  doc.search('.theme-block-hover').each_with_index do |element, index|
    image = URL_IMAGES + element.search('img').attr('src').text.gsub(/ /, "%20")
    id = element.search('a').attr('data-id').text
    name = element.search('b').text
    scientific_name = element.search('span').text
    scientific_name_splitted = scientific_name.split
    p "id: #{id}"
    p "name: #{name}"
    p "scientific_name: #{scientific_name}"
    p "image: #{image}"

    fish_url = "#{URL_FISH_BASE + scientific_name_splitted[0].capitalize}-#{scientific_name_splitted[1].downcase}.html"
    html_content_fish = URI.open(fish_url).read
    doc_fish = Nokogiri::HTML(html_content_fish)
    #description
    information = doc_fish.search('#ss-main').search('.smallSpace')
    next if information.empty?
    habitat = information[2].text.strip.gsub(/[\t\r\n]/, "")
    description = information[4].text.strip.gsub(/[\t\r\n]/, "")
    p "habitat: #{habitat}"
    p "description: #{description}"
    sizes = information[3].text.strip.gsub(/[\t\r\n]/, "").scan(/\S+ cm/).select do |size|
      !size.start_with? "?"
    end
    sizes = sizes.map do |size|
      size.split[0].to_i
    end
    sizes.sort!
    minimum_size = sizes[0]
    maximum_size = sizes[-1]
    p "minimum_size: #{minimum_size}"
    p "maximum_size: #{maximum_size}"
    fish_csv << [index/2 + 1, name, description, habitat, scientific_name, minimum_size, maximum_size, image]
    unless all_baits_fish[name].nil?
      all_baits_fish[name].each do |bait|
        bait_catches_csv << [cont, index / 2 + 1, all_baits.find_index(bait)]
        cont += 1
      end
    end
  end
end
