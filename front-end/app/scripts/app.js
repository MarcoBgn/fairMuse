'use strict';

var fairMuse = angular
.module('fairMuseApp', [
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngRoute',
  'ngSanitize',
  'ngTouch',
  'ui.bootstrap',
  'com.2fdevs.videogular',
  'com.2fdevs.videogular.plugins.controls',
  'ngFileUpload',
  'flash'
  ])

.factory('authInterceptor', function($q, $location){
  return {
    request: function(config) {
      config.headers = config.headers || {};
      if(localStorage.auth_token) {
        config.headers.token = localStorage.auth_token;
      }
      return config;
    },
    responseError: function(response) {
      if (response.status === 401) {
        $location.path('/login');
      }
      return $q.reject(response);
    }
  }
})

.config(function($httpProvider) {
  $httpProvider.interceptors.push('authInterceptor');
})

.config(function ($routeProvider) {
  $routeProvider
  .when('/', {
    templateUrl: 'views/main.html',
    controller: 'MainCtrl',
    controllerAs: 'main'
  })
  .when('/artist',{
    templateUrl: 'views/artist.html',
    controller: 'ArtistCtrl',
    controllerAs: 'artist'
  })
  .when('/about', {
    templateUrl: 'views/about.html',
    controller: 'AboutCtrl',
    controllerAs: 'about'
  })
  .when('/success', {
    templateUrl: 'views/success.html',
    controller: 'SuccessCtrl',
    controllerAs: 'success'
  })
  .when('/songs', {
    templateUrl: 'views/songs.html',
    controller: 'MainCtrl',
    controllerAs: 'main'
  })
  .when('/signup', {
    templateUrl: 'views/signup.html',
    controller: 'SignupCtrl',
    controllerAs: 'signup'
  })
  .when('/login', {
    templateUrl: 'views/login.html',
    controller: 'LoginCtrl',
    controllerAs: 'login'
  })
  .when('/user', {
    templateUrl: 'views/user.html',
    controller: 'UserCtrl',
    controllerAs: 'user'
  })
  .when('/account', {
    templateUrl: 'views/account.html',
    controller: 'AccountCtrl',
    controllerAs: 'account'
  })
  .otherwise({
    redirectTo: '/'
  });
});
