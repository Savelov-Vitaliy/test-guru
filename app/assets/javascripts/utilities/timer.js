document.addEventListener('turbolinks:load', function(){

  var $timer = $('.Timer');
  if ($timer.length) { timer($timer); };

});

function timer($timer) {
  var $form_timer = $('#timer');
  var test_time = $timer.text()*1;
  var time_start = $('#time_start').text()*1;
  var sec = (time_start + test_time - time_now());

  $timer.text(min_sec(sec));

  var timer = setInterval(function() {
    sec -= 1
    if ((time_now() - time_start) > test_time) {
      clearInterval(timer);
      window.location.replace(window.location.pathname+'/result');
    } else {
      $timer.text(min_sec(sec));
      $form_timer.val(sec);
    };
  }, 1000);

};

function min_sec(sec) {
  return Math.floor(sec / 60) + ': ' + ("0" + sec % 60).slice(-2)
}

function time_now(){
  return Math.floor(Date.now()/1000);
};
