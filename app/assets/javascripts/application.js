// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function(){

  $(".alert" ).fadeOut(6000);

  $("body").on("click", '#customize', function(){
    $(".customize_commission").toggle(1000);
    $('#customize').hide();
  });

  $("body").on("click", '#btn-cancel', function(){
    $(".customize_commission").hide(1000);
    $('#customize').show(1000);
    FB.AppEvents.logEvent("Click botón Cancelar");
    FB.AppEventsLogger.setUserID("Userx00001");
  });

});

function isNumberKey(e) {
  var charCode = (e.which) ? e.which : event.keyCode;
  return (charCode > 31 && (charCode < 48 || charCode > 57)) ? false : true
}

function isNumberKeyorPoint(e) {
  var charCode = (e.which) ? e.which : event.keyCode;
  return (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57)) ? false : true
}

function onButtonClick() {
  // Add this to a button's onclick handler
  FB.AppEvents.logEvent("sentFriendRequest");
}
