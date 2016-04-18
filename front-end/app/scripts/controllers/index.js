'use strict';

  fairMuse.controller('IndexCtrl', function($location, authenticationService) {
    var
    authenticationService = authenticationService

    this.LoggedIn = authenticationService.isLoggedIn();
    this.isUser = localStorage.getItem("is_user");
    this.isArtist = localStorage.getItem("is_artist");

    this.testbutton = function(){
      console.log("is user" + localStorage.getItem("is_user"))
      console.log("is artist" + localStorage.getItem("is_artist"))
      console.log("auth token" + localStorage.getItem("auth_token"))
    };

    this.clearLocalStorage = function(){
      localStorage.clear()
      localStorage.removeItem("artist_id")
    };

    this.LogOut = function(){
      var promise = authenticationService.LogOut();
      promise.then(function(){
        localStorage.removeItem("auth_token");
        localStorage.removeItem("user_id");
        localStorage.removeItem("is_user");
        $location.path("/views/main.html");
      });
    }
      this.bob = function(){
        var promise = authenticationService.artistLogout();
        promise.then(function(){
          localStorage.removeItem("auth_token");
          localStorage.removeItem("artist_id");
          localStorage.removeItem("is_artist");
          $location.path("/views/main.html");
        });
      }

  });
