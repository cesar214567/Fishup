// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initCarrousel} from "../plugins/init_carrousel";
import { initCityCountry } from "../plugins/init_city&country";
import {initMapbox} from "../plugins/init_mapbox";
import {initMapbox1} from "../plugins/spot_mapbox";
document.addEventListener("turbolinks:load", () => {
	initMapbox1();
	initMapbox();
  initCarrousel();
  initCityCountry();
});
