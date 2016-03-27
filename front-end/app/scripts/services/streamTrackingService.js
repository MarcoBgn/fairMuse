angular.module('fairMuseApp').service('streamTrackingService', function($http){
 var streamTrackingService, track, params;
 this.track = function(id){
 	params = {track_id: id}
 	return $http.post('http://localhost:3000/streams',params);
 };
});