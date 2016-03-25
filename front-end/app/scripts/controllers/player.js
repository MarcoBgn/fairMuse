'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", function ($sce) {
    this.songList = [
      {
        songId: 1,
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://static.videogular.com/assets/audios/videogular.mp3"),
            type: "audio/mpeg"
          }
        ]
      },
      {
        songId: 2,
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://s3-eu-west-1.amazonaws.com/fairmusetracks.bucket/tracks/files/000/000/001/original/testsong.mp3?1458920645"),
            type: "audio/mpeg"
          }
        ]
      },
      {
        songId: 3,
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://s3-eu-west-1.amazonaws.com/fairmusetracks.bucket/tracks/files/000/000/002/original/Modern_World_%28Anouk_Cover%29.mp3?1458922573"),
            type: "audio/mpeg"
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
    };
  }]
);