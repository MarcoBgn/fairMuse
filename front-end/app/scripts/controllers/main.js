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
        },
        {
          image: 'http://l7.alamy.com/zooms/c930861ceb6f48feafde7c6147d2e01e/a-steel-worker-in-front-of-a-blast-furnace-in-benxi-iron-and-steel-axpjcf.jpg '
        }
      ];
    }
    self.user = localStorage.getItem('user_id')
  });