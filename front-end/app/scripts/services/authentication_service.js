angular.module('fairMuseApp').service('authenticationService', function($http, $location){
	var location = $location	
		this.login= function(user) {
      console.log(user)
		return $http.post("http://localhost:3000/api/login", user).success(function(status){
        location.path('/songs');
      });
		};
	});