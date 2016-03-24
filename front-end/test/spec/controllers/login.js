'use strict';

describe('Controller: LoginCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

  var LoginCtrl,
      scope;


  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    LoginCtrl = $controller('LoginCtrl', {
      $scope: scope
    });
    LoginCtrl.user = {email: "name", password: "password"};
  }));

  describe('Receives and stores data from a form', function(){
    it('has login data', function(){
      expect(LoginCtrl.sendForm()).toEqual({email: "name", password: "password"})
    });
  });
});
