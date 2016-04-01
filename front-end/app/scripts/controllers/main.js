'use strict';

angular.module('fairMuseApp')
  .controller('MainCtrl', function() {

    var self = this
    function CarouselDemoCtrl(){
      self.myInterval = 3000;
      self.slides = [
        {
          image: 'http://img.gawkerassets.com/img/17vzbduvh99gnjpg/original.jpg'
        },
        {
          image: 'http://img.gawkerassets.com/img/17vzbduvh99gnjpg/original.jpg'
        }
      ];
    }
    self.user = localStorage.getItem('user_id')
  });