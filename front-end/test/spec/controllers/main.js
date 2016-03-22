'use strict';

describe('Controller: MainCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

  var MainCtrl,
    scope;

  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    MainCtrl = $controller('MainCtrl', {
      $scope: scope
    });
  }));

  it('should attach the team member names to the scope', function () {
    expect(MainCtrl.awesomeTeam.length).toBe(4);
  });
});
