describe('Service: tracksListService', function(){
var httpBackend, params, tracksListService

beforeEach(function(){
	module('fairMuseApp');
	module('ui.bootstrap');

	inject(function(_$httpBackend_, _tracksListService_){
		httpBackend = _$httpBackend_
		tracksListService = _tracksListService_
		httpBackend.expectGET('views/main.html').respond(200)
		httpBackend.expectGET('http://localhost:3000/tracks').respond(200)
	});
});

	it('sends a get request to the API', function(){
		httpBackend.flush()
		tracksListService.getList()
		expect(httpBackend.flush).not.toThrow();
	});

});
