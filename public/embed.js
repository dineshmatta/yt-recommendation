window.onload = function() {
   //Params
   var scriptPram = document.getElementById('load_widget');
   var url = scriptPram.getAttribute('data-url');

   //iFrame
   var iframe = document.createElement('iframe');
   iframe.style.border = "none";
   iframe.src = "https://yieldblue-recommendation.herokuapp.com/embed?url="+encodeURIComponent(url);
   iframe.width = "1000px";
   iframe.height = "500px";
   document.body.appendChild(iframe);
};