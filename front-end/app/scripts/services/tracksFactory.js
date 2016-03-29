'use strict';

// fairMuse.factory('TracksFactory', function($resource) {
// 			return $resource('http://localhost:3000/tracks');
// 		});

angular.module('fairMuseApp').factory('TracksFactory', ['$http', function($http) {
  var TracksFactory = {};

  TracksFactory.load = function(callback) {
    $http.get('http://localhost:3000/tracks').success(function(data) {
      callback(data);
    })};
   return TracksFactory;
 	}
 ]);