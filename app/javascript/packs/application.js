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


document.addEventListener('DOMContentLoaded', () => {
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