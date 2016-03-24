'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", function ($sce) {
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
            src: "songs/testsong.mp3",
            type: "audio/mpeg",
            name: "Yan-Yi's song"
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
    this.currentSongName = function(){
      if (this.config.sources) {
        return this.config.sources[0].name
      }
    }
  }]
);