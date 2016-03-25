angular.module('fairMuseApp').service('authenticationService', function($http, $location){
	var location = $location	
		this.login= function(user) {
      console.log(user)
		return $http.post("http://localhost:3000/api/login", user); 
		};
	
		this.isLoggedIn = function(){
			return (localStorage.getItem('auth_token')) ? true : false;
		};

	});