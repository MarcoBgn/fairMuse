'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", "streamTrackingService","TracksFactory", function ($sce, streamTrackingService, TracksFactory) {
   var self = this, tracks, songList

    var streamTrackingService;
    
    this.tracks = TracksFactory.query(function(){
     
      self.songList = []
      for (var i = 0; i <= self.tracks.length -1; i++) {
      
         self.songList.push({
           songId: i+1,
           name: self.tracks[i].name,
           genre: self.tracks[i].genre,
           sources: [
             {
               src: $sce.trustAsResourceUrl(self.tracks[i].track_url),
               type: self.tracks[i].file_content_type,
               name: self.tracks[i].name
             }
           ]
         })
      }
     

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