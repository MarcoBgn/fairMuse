fairMuse.controller('MyCarouselController', function ($scope) {

  $scope.myInterval = 5000;
  $scope.noWrapSlides = false;
  $scope.active = 0;
  var slides = $scope.slides = [];
  var currIndex = 0;

  $scope.addSlide = function() {
    var newWidth = 900 + slides.length + 1;
    slides.push({
      image: 'http://lorempixel.com/' + newWidth + '/450/city',
      text: ['Space','Night','Peace','Adventure'][slides.length % 4],
      id: currIndex++
    });
  };

  $scope.randomize = function() {
    var indexes = generateIndexesArray();
    assignNewIndexesToSlides(indexes);
  };

  for (var i = 0; i < 4; i++) {
    $scope.addSlide();
  }
});