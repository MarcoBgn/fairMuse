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

  describe('music selection', function() {
    it('sources should be empty by default', function() {
      expect(PlayerCtrl.config.sources).not.toBeDefined();
    });

    it('should change source of the player', function() {
      PlayerCtrl.changeSource(2);
      expect(PlayerCtrl.config.sources[0].src).toEqual("songs/testsong.mp3");
    });
  });
});
