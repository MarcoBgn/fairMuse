'use strict';

  fairMuse.controller('IndexCtrl', function($location, authenticationService) {
    var
    authenticationService = authenticationService

    this.LoggedIn = authenticationService.isLoggedIn();
    this.isUser = localStorage.getItem("is_user");
    this.isArtist = localStorage.getItem("is_artist");

    this.LogOut = function(){
      var promise = authenticationService.LogOut();
      promise.then(function(){
        localStorage.removeItem("auth_token");
        localStorage.removeItem("user_id");
        localStorage.removeItem("is_user");
        localStorage.removeItem("is_artist")
        $location.path("/login");
      });
    }

  });
