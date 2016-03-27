'use strict';

describe('Controller: PlayerCtrl', function () {
  var deferred; 
  
  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

  var PlayerCtrl, scope, streamTrackingService;

  beforeEach(inject(function ($controller, $rootScope, _streamTrackingService_) {
    scope = $rootScope.$new();
    streamTrackingService = _streamTrackingService_
    PlayerCtrl = $controller('PlayerCtrl', {
      $scope: scope
    });
  }));

  describe('music selection', function() {
    it('sources should be empty by default', function() {
      expect(PlayerCtrl.config.sources).not.toBeDefined();
    });

    it('should change source of the player', function() {
      spyOn(streamTrackingService, 'track');
      PlayerCtrl.changeSource(2);
      expect(PlayerCtrl.config.sources[0].name).toEqual("Yan-Yi's song");
      expect(streamTrackingService.track).toHaveBeenCalled();
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
