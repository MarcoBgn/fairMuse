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
  };
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
  .when('/artistsignup',{
    templateUrl: 'views/artist_signup.html',
    controller: 'ArtistCtrl',
    controllerAs: 'artist'
  })
  .when('/artistsignin',{
    templateUrl: 'views/artist_signin.html',
    controller: 'ArtistSigninCtrl',
    controllerAs: 'artistSignin'
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
  .when('/useraccount', {
    templateUrl: 'views/user_account.html',
    controller: 'UserCtrl',
    controllerAs: 'user'
  })
  .when('/upload', {
    templateUrl: 'views/upload.html',
    controller: 'UploadCtrl',
    controllerAs: 'upload'
  })
  .when('/artistaccount', {
    templateUrl: 'views/artist_account.html',
    controller: 'ArtistCtrl',
    controllerAs: 'artist'
  })
  .otherwise({
    redirectTo: '/'
  });
});
