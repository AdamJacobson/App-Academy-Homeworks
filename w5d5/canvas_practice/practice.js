document.addEventListener("DOMContentLoaded", function(){
  // Part 1
  let canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');

  // Part 2
  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10, 55, 50);

  // Part 3 - Draw a circle
  ctx.beginPath();
  ctx.arc(75, 75, 30, 0, 2 * Math.PI);
  ctx.strokeStyle = 'rgb(0,200,0)';
  ctx.lineWidth = 5;
  ctx.stroke();

  ctx.fillStyle = 'rgb(0,0,200)';
  ctx.fill();
});
