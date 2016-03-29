'use strict';

  fairMuse.controller('UserCtrl', function ($http) {
    $http.get('http://localhost:3000/users');
    var self = this
    var promise = self.getPlayDetails()

    self.getPlayDetails = function(){
      $http.post('http://localhost:3000/streams', {user_id: localStorage.getItem('user_id')})
  };

  var success = function(response){
  this.playRecord = response.data;
  };

  var error = function(response) {
  flash('Wrong!');
  };
});
