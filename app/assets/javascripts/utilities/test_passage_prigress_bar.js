document.addEventListener('turbolinks:load', function(){

  var container = document.getElementsByTagName('small')[0];
  var progress_bar = document.createElement('progress');

  var progress = container.textContent.match(/\d/g);

  progress_bar.setAttribute('max', progress[1]);
  progress_bar.setAttribute('value', progress[0]);

  container.appendChild(progress_bar);

})
