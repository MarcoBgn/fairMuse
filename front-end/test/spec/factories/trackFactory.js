describe('Factory: TracksFactory', function(){
  var httpBackend, TracksFactory, deferred;
  var data = { data: { track_id: "1", name: "test"}};

beforeEach(function(){
	module('fairMuseApp');
	module('ui.bootstrap');

	inject(function(_$httpBackend_, _TracksFactory_ , $q){
    deferred = $q.defer();
		httpBackend = _$httpBackend_
		TracksFactory = _TracksFactory_
		httpBackend.expectGET('views/main.html').respond(200)
		httpBackend.flush()
	});
});

	it('sends a get request to the API', function(){
		httpBackend.whenGET('http://localhost:3000/tracks').respond(200)
		TracksFactory.query(function(){});
		expect(httpBackend.flush).not.toThrow();
	});
  
	it('returns a JSON object', function(){
		httpBackend.whenGET('http://localhost:3000/tracks').respond(data)
		TracksFactory.query(function(){data});
    deferred.promise.then(function(data) {
      httpBackend.flush()
    expect(httpBackend.flush).not.toThrow();
  	});
    })
});





