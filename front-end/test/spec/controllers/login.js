'use strict';

describe('Controller: LoginCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

 var authenticationService, LoginCtrl;
  
  beforeEach(inject(function($controller, _authenticationService_) {
    authenticationService = _authenticationService_
    LoginCtrl = $controller('LoginCtrl',  {
  }); 
  }));

    it('calls a service', function(){
      spyOn(authenticationService, "login")
      LoginCtrl.sendForm()
    	expect(authenticationService.login()).toHaveBeenCalled;
    });
 });