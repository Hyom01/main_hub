// JavaScript로 모달 제어
document.getElementById('openModalBtn').addEventListener('click', function () {
  document.getElementById('myModal').style.display = 'block';
});

document.getElementById('closeModalBtn').addEventListener('click', function () {
  document.getElementById('myModal').style.display = 'none';
});

window.addEventListener('click', function (event) {
  var modal = document.getElementById('myModal');
  if (event.target === modal) {
      modal.style.display = 'none';
  }
});
