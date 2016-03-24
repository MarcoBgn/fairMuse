angular.module('fairMuseApp').service('authenticationService', function($http, $location){
	var user = {}
  var location = $location
	var params = {email: user.email, 
		password: user.password}
		this.login= function(user) {
			return $http.post('http://localhost:3000/api/login', {email:'email', password: 'password'} ).success(function(data, status){
				location.path('/views/player');
			});
		};
	});