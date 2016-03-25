angular.module('fairMuseApp').service('authenticationService', function($http, $location){
	var user = {}
	var params = {email: user.email, 
		password: user.password}
	var location = $location	
		this.login= function(user) {
		return $http.post("http://localhost:3000/api/login", params).success(function(data, status){
        location.path('/songs');
      });
		};
	});