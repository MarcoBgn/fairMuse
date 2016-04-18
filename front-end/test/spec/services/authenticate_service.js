describe('Service: authenticationService', function(){
  var location, params, httpBackend, authenticationService, localStorage, $window, token;

  beforeEach(function(){
    
    module('fairMuseApp');
    module('ui.bootstrap');

    inject(function(_$httpBackend_, $location, _authenticationService_, _$window_){
      httpBackend = _$httpBackend_;
      authenticationService = _authenticationService_
      httpBackend.expectGET('views/main.html').respond(200)
      httpBackend.whenPOST('http://localhost:3000/api/login', params).respond(200)
      httpBackend.whenDELETE('http://localhost:3000/api/logout.json').respond(200)
      location = $location
      $window = _$window_
      $window.localStorage.setItem('auth_token', token);
    });
  });


  it('has a login function that sends a post to the backend', function(){
    httpBackend.flush()
    authenticationService.login()
    expect(httpBackend.flush).not.toThrow();    
  });

  it('has a logout function that sends a delete to the backend', function(){
    httpBackend.flush()
    authenticationService.LogOut()
    expect(httpBackend.flush).not.toThrow();    
  });

  it('checks to see if a user is logged in', function() {
   expect(authenticationService.isLoggedIn()).toEqual(true) 
 });

});


