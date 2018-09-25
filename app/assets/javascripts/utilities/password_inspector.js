document.addEventListener('turbolinks:load', function(){
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password_confirmation) { password_confirmation.addEventListener('input', password_inspector) }
})

function password_inspector() {
  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value
  var alert_cL = document.querySelector('.octicon-alert').classList
  var check_cL = document.querySelector('.octicon-check').classList

  if (password.length != 0) {
    if (password == password_confirmation) {
      alert_cL.add('hide')
      check_cL.remove('hide')
    } else {
      alert_cL.remove('hide')
      check_cL.add('hide')
    }
  }

}
