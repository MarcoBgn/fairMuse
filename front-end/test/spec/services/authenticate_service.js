

describe('Service: authenticationService', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));
  
  var authenticationService, httpBackend, location;

  beforeEach(inject(function($controller, _authenticationService_, _$httpBackend_, $location) {
      authenticationService = _authenticationService_;
      httpBackend = _$httpBackend_ ;
      location = $location
      httpBackend.expectGET('views/main.html').respond(200)
      httpBackend.whenPOST('http://localhost:3000/api/login').respond(200)
      }));
  
      it('should behave...', function() {
      httpBackend.flush()
      authenticationService.login()
      httpBackend.flush()
      expect(location.path()).toBe('/views/player')    
  });  
});




