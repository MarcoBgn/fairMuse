'use strict';

fairMuse.service('tracksListService', function($http) {
	var self = this;
	this.getList = function() {
		var tracksList = {};
		 return $http.get('http://localhost:3000/tracks.json') 
	};
})