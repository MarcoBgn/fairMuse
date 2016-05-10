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
        $location.path('/');
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
  .when('/about', {
    templateUrl: 'views/about.html',
    controller: 'AboutCtrl',
    controllerAs: 'about'
  })
  .when('/artist', {
    templateUrl: 'views/artist_access.html',
    controller: 'AccessCtrl',
    controllerAs: 'access'
  })
  .when('/listener',{
    templateUrl: 'views/listener_access.html',
    controller: 'AccessCtrl',
    controllerAs: 'access'
  })
  .when('/success', {
    templateUrl: 'views/success.html',
    controller: 'MainCtrl',
    controllerAs: 'main'
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
  .when('/subscribe', {
    templateUrl: 'views/subscribe.html',
    controller: 'MainCtrl',
    controllerAs: 'main'
  })
  .otherwise({
    redirectTo: '/'
  });
});
