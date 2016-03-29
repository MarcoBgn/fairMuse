'use strict';

  fairMuse.controller('IndexCtrl', function($location, authenticationService) {
    var
    authenticationService = authenticationService
    this.LoggedIn = authenticationService.isLoggedIn();

    this.LogOut = function(){
      var promise = authenticationService.LogOut();
      promise.then(function(){
        localStorage.removeItem("auth_token");
        $location.path("/login");
      });
      this.artistLogout = function(){
        var promise = authenticationService.artistLogout();
        promise.then(function(){
          localStorage.removeItem("auth_token");
          $location.path("/login")
        });
      }
    };
  });
