// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

 import jquery from "jquery"
 window.$ = jquery


 $(function() {

  // .delete-buttonがクリックされたらモーダルウィンドウを表示
  $("#modal-open-update").on('click', function(){

      // #modal-overlayをフェードイン(display: none; → block;)させる
      $("#modal-overlay-update").fadeIn("fast");

  });


  $("#modal-open-delete").on('click', function(){

      // #modal-overlayをフェードイン(display: none; → block;)させる
      $("#modal-overlay-delete").fadeIn("fast");

  });



  // .back-buttonか#modal-overlayがクリックされたらモーダルウィンドウを削除
   $("#modal-close, #modal-update-overlay, #modal-delete-overlay").on('click', function(){
    $("#modal-update-overlay, #modal-delete-overlay").fadeOut("fast");
  });



});

