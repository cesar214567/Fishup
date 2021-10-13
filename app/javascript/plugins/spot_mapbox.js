import mapboxgl from 'mapbox-gl';
import MapboxWorker from 'worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker';

const initMapbox1 = () => {
  let mapSpot;
  mapboxgl.workerClass = MapboxWorker;
  const mapElement = document.getElementById('map-spot');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    mapSpot = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/cesar21456/ckufny7yg2pjl17pf3u56bc9e',
      center: Geolocation.getCurrentPosition(), // starting position
      zoom: 9 // starting zoom

    });
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(mapSpot);
    });



  }
};

export { initMapbox1 };
