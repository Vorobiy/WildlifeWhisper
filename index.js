const slides = document.querySelectorAll(".canada-slide");
let slideIndex = 0;
let slideInterval = null;

document.addEventListener("DOMContentLoaded", initalizeSlider);

function initalizeSlider(){
    slides[slideIndex].classList.add("displaySlide");
  slideInterval = setInterval(nextDiv, 5000);

}

function showSlide(index){


  if(index >= slides.length){
    slideIndex = 0;

  }

  else if(index < 0){
    slideIndex = slides.length - 1;

  }
  slides.forEach(slide=>{
    slide.classList.remove("displaySlide");
  });

  slides[slideIndex].classList.add("displaySlide");


}

function prevDiv(){
  clearInterval(slideInterval);
  slideIndex--;
  showSlide(slideIndex);
}

function nextDiv(){
  clearInterval(slideInterval);
  slideIndex++;
  showSlide(slideIndex);

}


function specificDiv(index){
  slideIndex = index;
  clearInterval(slideInterval);
  showSlide(slideIndex);

}

async function initMap() {
  // Request needed libraries.
  const { Map } = await google.maps.importLibrary("maps");
  const myLatlng = { lat: 56.8863, lng: -106.044 };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 4,
    center: myLatlng,
  });
  // Create the initial InfoWindow.
  let marker = new google.maps.Marker({
    position: myLatlng,
    map,
    title: "Hello"
  });

  // Configure the click listener.
  map.addListener("click", (mapsMouseEvent) => {
    // Close the current InfoWindow.
    marker.setMap(null);
    // Create a new InfoWindow.
    marker = new google.maps.Marker({
      position: mapsMouseEvent.latLng,
      map,
      title: "Hello"
    });

    google.maps.event.addListener(map,'click', function(event) {
      console.log(event.latLng.lat());
      console.log(event.latLng.lng());
      })      
  });
}
window.initMap = initMap();