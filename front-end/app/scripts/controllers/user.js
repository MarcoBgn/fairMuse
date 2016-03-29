'use strict';

  fairMuse.controller('UserCtrl', function ($http) {
    $http.get('http://localhost:3000/users');
    var self = this;
    // var promise = self.getPlayDetails()

    self.getPlayDetails = function(){
      return $http.post('http://localhost:3000//api/streaminfo', {user_id: localStorage.getItem('user_id')})
  };

  var success = function(response){
    console.log(response.data);
  this.playRecord = response.data;
  };

  var error = function(response) {
  flash('Wrong!');
  };
});
