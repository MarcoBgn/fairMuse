'use strict';

describe('Controller: PlayerCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

  var PlayerCtrl,
    scope;

  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    PlayerCtrl = $controller('PlayerCtrl', {
      $scope: scope
    });
  }));

  it('Should store information about songs url', function () {
    expect(PlayerCtrl.config.sources.length).toBe(2);
  });
});
