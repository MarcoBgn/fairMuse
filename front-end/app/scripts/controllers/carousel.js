fairMuse.controller('MyCarouselController', function () {

  var self = this;

  this.myInterval = 5000;
  this.noWrapSlides = false;
  this.active = 0;
  var pics = []
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
