'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function () {
  	this.user = {}
 	this.sendForm = function() {
 		this.logindata = this.user
 		return this.logindata
 	}
  
  });
