window.onload = function() {
   //Params
   var scriptPram = document.getElementById('load_widget');
   var url = scriptPram.getAttribute('data-url');

   //iFrame
   var iframe = document.createElement('iframe');
   iframe.style.border = "none";
   iframe.src = "http://54.173.125.80/embed?url="+encodeURIComponent(url);
   iframe.width = "1000px";
   iframe.height = "500px";
   document.body.appendChild(iframe);
};