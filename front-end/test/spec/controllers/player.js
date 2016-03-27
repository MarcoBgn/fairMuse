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
      expect(PlayerCtrl.config.sources[0].name).toEqual("Yan-Yi's song");
    });
  });
  describe('displaying songs', function(){
    it("should display the song's name", function(){
      PlayerCtrl.changeSource(1);
      expect(PlayerCtrl.config.sources[0].name).toEqual("default song")
    })
    it('contains the name within the songlist', function(){
      expect(PlayerCtrl.songList[0].name).toEqual("default song")
    })
  })
});
