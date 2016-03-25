describe('Controller: authenticationService', function(){
  var location,params,httpBackend,authenticationService, user;

  beforeEach(function(){
      
      beforeEach(module('fairMuseApp'));
      beforeEach(module('ui.bootstrap'));

    inject(function(_$httpBackend_, $location, _authenticationService_){
      user = {}
      httpBackend = _$httpBackend_;
      authenticationService = _authenticationService_
      httpBackend.expectGET('views/main.html').respond(200)
      httpBackend.whenPOST('http://localhost:3000/api/login', params).respond(200)
      httpBackend.whenGET('views/songs.html').respond(200)
      location = $location
      params = {"name":"new space"}
    });
  });

  it('sends a post to the backend', function(){
    httpBackend.flush()
    authenticationService.login()
    httpBackend.flush()
    expect(location.path()).toBe('/songs')
  })

});