require 'open-uri'
require 'nokogiri'
require 'csv'
require "i18n"

task :scrapping do
  fish_csv = CSV.open("catches.csv", "wb", col_sep: "|")
  baits_csv = CSV.open("baits.csv", "wb", col_sep: "|")
  bait_catches_csv = CSV.open("bait_catches.csv", "wb", col_sep: "|")

  # hash having all baits
  table = CSV.parse(File.read("baits2.csv")).flatten
  table.each_with_index do |name, index|
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

    next if image != I18n.transliterate(image)

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
    next if minimum_size =="" || minimum_size.nil?
    p "minimum_size: #{minimum_size}"
    p "maximum_size: #{maximum_size}"
    fish_csv << [index + 1, name, description, habitat, scientific_name, minimum_size, maximum_size, image]
    table.sample(rand(5)+1).each do |sample|
      bait_catches_csv << [cont, index + 1, table.find_index(sample) + 1]
      cont += 1
    end
  end
end
