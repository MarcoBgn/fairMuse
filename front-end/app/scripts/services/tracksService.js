'use strict';

fairMuse.service('TracksService', function($resource) {
  return $resource('http://localhost:3000/tracks');
});