fairMuse.controller('MyCarouselController', function () {

  var self = this;

  this.myInterval = 5000;
  this.noWrapSlides = false;
  this.active = 0;
  var pics = ["http://bsrv.wallpapersten.com/media/wp/1-17-4/brunette-with-headphones-enjoying-the-music-1080p-girl-desktop-wallpaper-27464.jpg", "http://img.gawkerassets.com/img/17vzbduvh99gnjpg/original.jpg", "https://whileyouweresleeping.files.wordpress.com/2015/04/maxresdefault.jpg", "http://c8.alamy.com/comp/AXPJ9C/a-steel-worker-in-front-of-a-blast-furnace-in-benxi-iron-and-steel-AXPJ9C.jpg"]

  var slides = this.slides = [];
  var currIndex = 0;

  this.addSlide = function() {
    var newWidth = 900 + slides.length + 1;
    slides.push({
      image: pics[currIndex],
      text: ['Space','Night','Peace','Adventure'][slides.length % 4],
      id: currIndex++
    });
  };




  this.randomize = function() {
    var indexes = generateIndexesArray();
    assignNewIndexesToSlides(indexes);
  };

  for (var i = 0; i < 4; i++) {
    this.addSlide();
  }
});