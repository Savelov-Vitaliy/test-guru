document.addEventListener('turbolinks:load', function(){

  var $timer = $('.Timer');
  if ($timer.length) { timer($timer); };

});

function timer($timer) {
  var $formTimer = $('#timer');
  var sec = +$timer.text();

  $timer.text(min_sec(sec));

  var timer = setInterval(function() {
    sec -= 1
    if (sec <= 0) {
      clearInterval(timer);
      $('#form-answer').submit();
    } else {
      $timer.text(min_sec(sec));
      $formTimer.val(sec);
    };
  }, 1000);

};

function min_sec(sec) {
  return Math.floor(sec / 60) + ': ' + ("0" + sec % 60).slice(-2)
}
