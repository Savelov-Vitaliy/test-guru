document.addEventListener('turbolinks:load', function(){

  var $rule = $("#badge_rule");
  $rule.on('change', set_param);
  $rule.change();

  var $color = $("#badge_color");
  $color.on('change', set_color);
  $color.change();

});

function set_color(event){
  var $color = $(this)
  $color.css("background-color", $color.val());
};


function set_param(event){
  var rule = $(this).val();
  var $level = $("#level");
  var $input = $level.find("input")
  var $category = $("#category");
  var $select = $category.find("select")

  if (rule == 'with_category') {
    hide($level, $input);
    show($category, $select);
  } else if (rule == 'with_level') {
    show($level, $input);
    hide($category, $select);
  } else {
    hide($level, $input);
    hide($category, $select);
  };

};


function hide(elem, sub){
  elem.hide();
  sub.prop('disabled', true);
};


function show(elem, sub){
  elem.show();
  sub.prop('disabled', false);
};
