'use strict';

describe('Controller: AboutCtrl', function () {

  beforeEach(module('fairMuseApp'));
  beforeEach(module('ui.bootstrap'));

  var AboutCtrl,
    scope;

  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AboutCtrl = $controller('AboutCtrl', {
      $scope: scope
    });
  }));

});
