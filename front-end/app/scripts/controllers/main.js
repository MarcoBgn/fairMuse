'use strict';

angular.module('fairMuseApp')
  .controller('MainCtrl', function() {

    this.awesomeTeam = [
      'Russel',
      'Mark',
      'Yan-yi',
      'Marco',
      'David'
    ];
     this.user = localStorage.getItem('user_id')
  });