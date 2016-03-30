'use strict';

describe('Controller: PlayerCtrl', function () {
  var PlayerCtrl, scope, streamTrackingService, deferred, httpBackend;
  
  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));
  beforeEach(inject(function ($controller, $rootScope, _streamTrackingService_, $q, _$httpBackend_) {
    httpBackend = _$httpBackend_
    deferred = $q.defer();
    scope = $rootScope.$new();
    streamTrackingService = _streamTrackingService_
    httpBackend.expectGET('views/main.html').respond(200)
    httpBackend.whenGET('http://localhost:3000/tracks').respond(200)
    PlayerCtrl = $controller('PlayerCtrl', {
      $scope: scope
    });
  }));

  describe('TracksService is called', function() {
    it('by the Player Controller', function() {
      PlayerCtrl.tracks
      expect(httpBackend.flush).not.toThrow();
    })
  });
});
