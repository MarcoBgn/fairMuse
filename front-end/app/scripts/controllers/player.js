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
            src: "songs/testSong.mp3",
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

    var currentSong;

    this.getSong = function(id) {
     for(var i = 0; i < this.songList.length; i++) {
       if(this.songList[i].songId === id) {
         return currentSong = this.songList[i].sources;
       };
     };
    };

    this.changeSource = function(id){
      this.config.sources = this.getSong(id);
    }
  }]
);