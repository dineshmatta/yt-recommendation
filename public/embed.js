window.onload = function() {
   //Params
   var scriptPram = document.getElementById('load_widget');
   var url = scriptPram.getAttribute('data-url');

   //iFrame
   var iframe = document.createElement('iframe');
   iframe.style.border = "none";
   iframe.id = "yieldblue_main_iframe";
   iframe.src = "https://youtube-rails-dineshdhoom.c9users.io/embed?url="+encodeURIComponent(url);
   iframe.width = "1000px";
   iframe.height = "500px";
   document.body.appendChild(iframe);
   //setTimeout(function(){ iframeclick(); }, 10000);

   
};

function iframeclick() {
    document.getElementById("yieldblue_main_iframe").addEventListener('click', function(event) {
        clic(this.id);
    }, false);
}

function clic(id){
    alert(id);
}

function trackVideoClick(){
   // This code loads the IFrame Player API code asynchronously.
   var tag = document.createElement('script');
   tag.src = "https://www.youtube.com/iframe_api";
   var firstScriptTag = document.getElementsByTagName('script')[0];
   firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}

function onYouTubeIframeAPIReady() {
      // This function takes the existing <iframe> (and YouTube player)
      // with id 'recommend_0' and adds an event listener for state changes.
         var player;
         player = new YT.Player('recommend_0', {
          events: {
            'onStateChange': onPlayerStateChange
          }
         });
   }

function onPlayerStateChange(event){
   switch(event.data) {
    case YT.PlayerState.PLAYING:
      console.log('playing videos');
      break;
    case YT.PlayerState.PAUSED:
      console.log('playing paused');
      break;
    case YT.PlayerState.ENDED:
      console.log('playing ended');
      break;
    default:
      return;
   }
   
}