'use strict';

fairMuse.controller('ModalCtrl',['$uibModal', function($uibModal){
  this.animationsEnabled = true;
   this.open = function () {
   	var modalInstance = $uibModal.open({
   		animation: $scope.animationsEnabled,
   		templateUrl: 'artist_signup.html',
   		controller: 'ArtistCtrl'
   	})
   }
}]);