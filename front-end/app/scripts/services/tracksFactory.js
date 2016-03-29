'use strict';

fairMuse.factory('TracksFactory', function($resource) {
			return $resource('http://localhost:3000/tracks');
		});