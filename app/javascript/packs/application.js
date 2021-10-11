// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
});
const cities = document.getElementById("user_city");
const countries = document.getElementById("user_country");
if (countries){
  countries.addEventListener('change', (event) => {
    cities.innerHTML = "";
    const actual_country = countries.options[countries.selectedIndex];
    fetch('https://countriesnow.space/api/v0.1/countries/cities',
      {
        method: "POST",
        body: JSON.stringify({"country": actual_country.text }),
        headers: {
          "X-Powered-By": "Express",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
          "Content-Type": "application/json",
          "Content-Length": 858,
          "ETag": "W/35a-V15oVpwHN0jBGP5cr5uJtRIWeW4",
          "Date": Date.now(),
          "Connection": "keep-alive"
        }
      })
      .then(response => response.json())
      .then(response => {
        response.data.forEach(element => {
          cities.insertAdjacentHTML("beforeend",`<option value="${element}">${element}</option>`)
        })

      })
  });
}
