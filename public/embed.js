window.onload = function() {
   //Params
   var scriptPram = document.getElementById('load_widget');
   var url = scriptPram.getAttribute('data-url');

   //iFrame
   var iframe = document.createElement('iframe');
   //iframe.style.display = "none";
   iframe.src = "http://yieldblue-yt-222369.nitrousapp.com/embed/"+encodeURIComponent(url);
   document.body.appendChild(iframe);
};