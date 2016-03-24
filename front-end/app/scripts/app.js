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
    'ngFileUpload'
  ])
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
      .when('/success', {
        templateUrl: 'views/success.html',
        controller: 'SuccessCtrl',
        controllerAs: 'success'
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