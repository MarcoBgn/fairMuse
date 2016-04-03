describe('Factory: TracksService', function(){
	var httpBackend, TracksService, deferred;
	var data = { data: { track_id: "1", name: "test"}};

	beforeEach(function(){
		module('fairMuseApp');
		module('ui.bootstrap');

		inject(function(_$httpBackend_, _TracksService_ , $q){
			deferred = $q.defer();
			httpBackend = _$httpBackend_
			TracksService = _TracksService_
			httpBackend.expectGET('views/main.html').respond(200)
			httpBackend.flush()
		});
	});

	it('sends a get request to the API', function(){
		httpBackend.whenGET('http://localhost:3000/tracks').respond(200)
		TracksService.query(function(){});
		expect(httpBackend.flush).not.toThrow();
	});
	
	it('returns a JSON object', function(){
		httpBackend.whenGET('http://localhost:3000/tracks').respond(data)
		TracksService.query(function(){data});
		deferred.promise.then(function(data) {
			httpBackend.flush()
			expect(httpBackend.flush).not.toThrow();
		});
	})
});





