// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"
import Chart from 'chart.js/auto';
import "../stylesheets/application" 

Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener('turbolinks:load', () => {
  const form = document.getElementById('daily-books-form');
  form.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;
    // check_daily_books.js.erbで処理されるため、ここでは特に処理は必要ない
  });

  form.addEventListener('ajax:error', () => {
    alert('エラーが発生しました。');
  });
});

import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}

document.addEventListener('turbolinks:load', function() {
  const elem = document.querySelector('#post_raty');
  
  // 要素が存在する場合にのみRatyを初期化
  if (elem) {
    const opt = {
      starOn: "/assets/star-on.png", // 画像パスは適宜変更
      starOff: "/assets/star-off.png", // 画像パスは適宜変更
      starHalf: "/assets/star-half.png", // 画像パスは適宜変更
      half: true,
      scoreName: 'score',
      click: function(score) {
        document.getElementById('rating-score').value = score; // 選択したスコアを隠しフィールドに設定
      }
    };
    window.raty(elem, opt); // Ratyを初期化
  } else {
    console.warn('Raty element not found.');
  }
});