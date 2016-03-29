'use strict';

describe('Factory:TrackFactory',function(){
	var httpBackend, tracksListService;

	beforeEach(function(){

		module('fairMuseApp');
		module('ui.bootstrap');
		
		inject(function($httpBackend, _tracksListService_){
			httpBackend = $httpBackend
			tracksListService = _tracksListService_
		});

	});

	it('should behave...', function() {
		
	});

});





