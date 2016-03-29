'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", "streamTrackingService","TracksFactory", function ($sce, streamTrackingService, TracksFactory) {
   var self = this, tracks, songList

    var streamTrackingService;
    
    this.tracks = TracksFactory.query(function(){
    console.log(tracks);

     self.songList = [
      {
        songId: 1,
        name: self.tracks[0].name,
        sources: [
          {
            src: $sce.trustAsResourceUrl("http://static.videogular.com/assets/audios/videogular.mp3"),
            type: "audio/mpeg",
            name: "default song"
          }
        ]
      }
    ];

    self.config = {
      theme: {
         url: "http://www.videogular.com/styles/themes/default/latest/videogular.css"
      }
    };

    self.getSong = function(id) {
     for(var i = 0; i < this.songList.length; i++) {
       if(this.songList[i].songId === id) {
         return this.songList[i].sources;
       }
     }
    };

    self.changeSource = function(id){
      this.config.sources = this.getSong(id);
      streamTrackingService.track(id);
    };
    self.currentSongName = function(){
      if (this.config.sources) {
        return this.config.sources[0].name;
      }
    };

    });
  }]
);