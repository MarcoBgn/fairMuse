'use strict';

describe('Controller: LoginCtrl', function () {
  var deferred, authenticationService, LoginCtrl, email, 
 password, location, success, response;

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));
  beforeEach(inject(function($controller, _authenticationService_, $location, $q) {
    authenticationService = _authenticationService_
    deferred = $q.defer();
    spyOn(authenticationService, 'login').and.returnValue(deferred.promise);
    email = "email@test.com"
    password = "password"
    response = { data: { auth_token: "testToken"}}
    location = $location
    LoginCtrl = $controller('LoginCtrl',  {
  }); 
  }));

    it('calls a service', function(){
      LoginCtrl.sendForm(email, password)
      deferred.promise.then(function (success) {  
        expect(success()).toHaveBeenCalled();
        expect(location.path()).toEqual('/songs')
      })
    });
    
    it('stores an auth token when the login request is successful', function () {
      LoginCtrl.sendForm(email, password)
      deferred.promise.then(function (success) {  
        success(response);
        expect(localStoage.auth_token).toEqual('testToken');
      })
    })
 });

