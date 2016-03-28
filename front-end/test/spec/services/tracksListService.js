describe('Service: tracksListService', function(){
  var httpBackend, tracksListService, deferred;
  var data = { data: { track_id: "1", name: "test"}};

beforeEach(function(){
	module('fairMuseApp');
	module('ui.bootstrap');

	inject(function(_$httpBackend_, _tracksListService_, $q){
    deferred = $q.defer();
		httpBackend = _$httpBackend_
		tracksListService = _tracksListService_
		httpBackend.expectGET('views/main.html').respond(200)
		httpBackend.whenGET('http://localhost:3000/tracks.json').respond(data)
	});
});

	it('sends a get request to the API', function(){
		httpBackend.flush()
		tracksListService.getList()
		expect(httpBackend.flush).not.toThrow();
	});
  
	it('returns a JSON object', function(){
		httpBackend.flush()
    deferred.promise.then(function(data) {
  		expect(tracksListService.getList()).toEqual(data);
      httpBackend.flush()
  	});
    })
});
