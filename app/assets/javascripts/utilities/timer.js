document.addEventListener('turbolinks:load', function(){

  var $timer = $('.Timer');
  if ($timer.length) { timer($timer); };

});


function timer($timer) {
  var time = $timer.text();
  var $form_timer = $('#timer');
  var sec = time;

  $timer.text(min_sec(sec));

  var timer = setInterval(function() {
    sec -= 1
    $timer.text(min_sec(sec));
    $form_timer.val(sec);
  }, 1000);

  setTimeout(function() {
    clearInterval(timer);
    window.location.replace(window.location.pathname+'/result');
  }, time*1000);

};

function min_sec(sec) {
  return Math.floor(sec / 60) + ': ' + ("0" + sec % 60).slice(-2)
}
