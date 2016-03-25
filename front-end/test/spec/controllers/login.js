'use strict';

describe('Controller: LoginCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

 var authenticationService, LoginCtrl, email, 
 password, $location, success;
  
  beforeEach(inject(function($controller, _authenticationService_, $location) {
    authenticationService = _authenticationService_
    spyOn(authenticationService, 'login').and.returnValue(deferred.promise);
    email = "email@test.com"
    password = "password"
    location = $location
    LoginCtrl = $controller('LoginCtrl',  {
  }); 
  }));

    it('calls a service', function(){
      LoginCtrl.sendForm(email, password)
      expect(authenticationService.login()).toHaveBeenCalled;
    });
 });

