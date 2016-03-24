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
  }));

  describe('Receives and stores data from a form', function(){
    it('has login data', function(){
      expect(LoginCtrl.logindata).toEqual("LoginCtrl.user.name")
    });
  });
});
