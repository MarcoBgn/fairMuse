'use strict';

describe('Factory: authInterceptor', function () {
  var authInterceptor, httpProviderIt, $httpBackend, $window, token;  

beforeEach(function(){
    module('fairMuseApp', function($httpProvider) {
     httpProviderIt = $httpProvider;
  });
    module('ui.bootstrap');

    inject(function (_authInterceptor_, _$window_){
      authInterceptor = _authInterceptor_
      $window = _$window_
    });

});
    
  it('should have the authInterceptor as an interceptor', function () {
          expect(httpProviderIt.interceptors).toContain('authInterceptor');
    });

  it('should not place a token in the http request headers if no token is set', function() {
        var config = authInterceptor.request({headers: {} });
        expect(config.headers['token']).toBe(undefined);
      });

  it('should place a token in the http request headers after a token is set', function() {
        $window.localStorage.setItem('auth_token', token)
        var config = authInterceptor.request({headers: {} });
        expect(config.headers['token']).toBeDefined;
      });

});
