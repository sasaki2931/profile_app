// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
document.addEventListener('DOMContentLoaded', function() {
  // 閉じるボタンがクリックされたときにアラートを非表示にする
  $("#modal-close").on('click', function(){
    // モーダルウィンドウを非表示にする処理を追加
    $("#modal-overlay").fadeOut("fast"); // モーダルウィンドウ非表示
  });
});