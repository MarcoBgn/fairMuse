'use strict';

fairMuse.controller('ModalCtrl',['$uibModal', function($uibModal){
  this.animationsEnabled = true;
   this.open = function (template, controller) {
   	var modalInstance = $uibModal.open({
   		animation: this.animationsEnabled,
   		templateUrl: 'views/'+ template,
   		controller: controller 
   	})
   }
}]);