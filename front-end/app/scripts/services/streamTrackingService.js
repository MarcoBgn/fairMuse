angular.module('fairMuseApp').service('streamTrackingService', function($http){
 var streamTrackingService, track, params;
 this.track = function(id){
 	params = {track_id: id, user_id: localStorage.getItem('user_id')}
 	$http.post('http://localhost:3000/streams', params);
  return 0;
 };
});