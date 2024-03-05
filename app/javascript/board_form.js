document.addEventListener('DOMContentLoaded', function() {
    // この関数はDOMが完全に読み込まれた時に実行されます。
  
    // 画像プレビュー用の要素を取得します。
    const previewImage = document.getElementById('preview');
  
    // ファイル選択用の input 要素を取得します。
    const fileInput = document.getElementById('board_board_image');
  
    // ファイル選択が変更された時のイベントリスナーを追加します。
    fileInput.addEventListener('change', function() {
      // 選択されたファイルを取得します。
      const file = fileInput.files[0];
  
      // ファイルが存在する場合の処理
      if (file) {
        // FileReaderオブジェクトを作成します。
        const reader = new FileReader();
  
        // 読み込み完了時の処理を定義します。
        reader.onload = function(e) {
          // プレビュー用の画像要素のsrc属性に読み込んだデータURLを設定します。
          previewImage.src = e.target.result;
        };
  
        // ファイルをデータURLとして読み込みます。
        reader.readAsDataURL(file);
      }
    });
  });
  