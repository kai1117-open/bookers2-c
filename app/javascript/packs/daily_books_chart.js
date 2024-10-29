// app/javascript/packs/daily_books_chart.js
import Chart from 'chart.js/auto'; 

document.addEventListener('turbolinks:load', () => {
  
  const canvas = document.getElementById('daily-books-chart');
  
  const dailyBooksDataDiv = document.getElementById('daily-books-data');

  if (canvas && dailyBooksDataDiv) {
    const ctx = canvas.getContext('2d');
    const dailyBooksData = JSON.parse(dailyBooksDataDiv.dataset.dailyBooks);

    // データを逆順に取得
    const labels = dailyBooksData.map(data => data.date).reverse();
    const counts = dailyBooksData.map(data => data.count).reverse();

    // Chartのインスタンスを作成
    new Chart(ctx, {
      type: 'bar', // グラフの種類
      data: {
        labels: labels,
        datasets: [{
          label: '投稿数',
          data: counts,
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  } else {
    console.error('Canvasまたはデータ要素が見つかりません。');
  }
});
