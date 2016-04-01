'use strict';

fairMuse.controller('PlayerCtrl',
  ["$sce", "streamTrackingService","TracksService", function ($sce, streamTrackingService, TracksService) {
   var self = this
   var streamTrackingService;
    
    this.tracks = TracksService.query(function(){
      self.songList = []
      for (var i = 0; i <= self.tracks.length -1; i++) {
      
         self.songList.push({
           songId: i+1,
           name: self.tracks[i].name,
           genre: self.tracks[i].genre,
           image: self.tracks[i].image_url,
           artist_id: self.tracks[i].artist_id,
           artist_name: self.tracks[i].artist_name,
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