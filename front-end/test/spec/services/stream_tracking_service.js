describe('Service: streamTrackingService', function() {
	var httpBackend, params, streamTrackingService

	beforeEach(function(){

		module('fairMuseApp');
		module('ui.bootstrap');

		inject(function(_$httpBackend_, _streamTrackingService_){
			httpBackend = _$httpBackend_
			streamTrackingService = _streamTrackingService_
			params = {track_id: 1, user_id: localStorage.getItem('user_id')}
			httpBackend.expectGET('views/main.html').respond(200)
			httpBackend.whenPOST('http://localhost:3000/streams', params).respond(200)
		});
	});

	it('sends a post to the API', function() {
		httpBackend.flush()
		streamTrackingService.track(1)
		expect(httpBackend.flush).not.toThrow();
	});
});