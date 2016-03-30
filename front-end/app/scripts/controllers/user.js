'use strict';

  fairMuse.controller('UserCtrl', function ($http) {
    $http.get('http://localhost:3000/users');
    var self = this;

    self.pay = function(){
      $http.post('http://localhost:3000/api/payment', {user_id: localStorage.getItem('user_id') })
    }

    self.displayStreamDetails = function(){
          var promise = self.getStreamDetails();
          promise.then(success, error);
        };

    self.getStreamDetails = function(){
      return $http.post('http://localhost:3000/api/streaminfo', {user_id: localStorage.getItem('user_id')})
  };

  var success = function(response){
    console.log(response.data);
    self.returnData = response.data
  };

  var error = function(response) {
  flash('Wrong!');
  };
});
