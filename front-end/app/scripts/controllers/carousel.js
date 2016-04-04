fairMuse.controller('MyCarouselController', function () {

  var self = this;

  this.myInterval = 5000;
  this.noWrapSlides = false;
  this.active = 0;
  var pics = ["http://bsrv.wallpapersten.com/media/wp/1-17-4/brunette-with-headphones-enjoying-the-music-1080p-girl-desktop-wallpaper-27464.jpg", "http://img.gawkerassets.com/img/17vzbduvh99gnjpg/original.jpg", "https://whileyouweresleeping.files.wordpress.com/2015/04/maxresdefault.jpg"]

  var slides = this.slides = [];
  var currIndex = 0;

  this.addSlide = function() {
    slides.push({
      image: pics[currIndex],
      text: ['Place','Holder','For','Proposition'][slides.length % 4],
      id: currIndex++
    });
  };

  for (var i = 0; i < 3; i++) {
    this.addSlide();
  }
});