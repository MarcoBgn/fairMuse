'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", "streamTrackingService","tracksListService", function ($sce, streamTrackingService, tracksListService) {
   var self = this
    var streamTrackingService, tracksListService, data, tracks, $scope;
    
    var promise = tracksListService.getList()

    self.tracks = promise.then(function(response){
    console.log(response.data)
    });

    
    this.songList = [
      {
        songId: 1,
        name: "default song",
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://static.videogular.com/assets/audios/videogular.mp3"),
            type: "audio/mpeg",
            name: "default song"
          }
        ]
      },
      {
        songId: 2,
        name: "Yan-Yi's song",
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://s3-eu-west-1.amazonaws.com/fairmusetracks.bucket/tracks/files/000/000/001/original/testsong.mp3?1458920645"),
            type: "audio/mpeg",
            name: "Yan-Yi's song"
          }
        ]
      },
      {
        songId: 3,
        name: "Another Track",
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://s3-eu-west-1.amazonaws.com/fairmusetracks.bucket/tracks/files/000/000/002/original/Modern_World_%28Anouk_Cover%29.mp3?1458922573"),
            type: "audio/mpeg",
            name: "Another Track"
          }
        ]
      }
    ];

    this.config = {
      theme: {
         url: "http://www.videogular.com/styles/themes/default/latest/videogular.css"
      }
    };

    this.getSong = function(id) {
     for(var i = 0; i < this.songList.length; i++) {
       if(this.songList[i].songId === id) {
         return this.songList[i].sources;
       }
     }
    };

    this.changeSource = function(id){
      this.config.sources = this.getSong(id);
      streamTrackingService.track(id);
    };
    this.currentSongName = function(){
      if (this.config.sources) {
        return this.config.sources[0].name;
      }
    };
  }]
);