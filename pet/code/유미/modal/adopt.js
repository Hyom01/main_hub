// modal.js

function openModal() {
    document.getElementById("myModal").style.display = "block";
}



// 모달 외부를 클릭하면 모달이 닫히도록 설정
window.onclick = function(event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


function closeModal() {
    document.getElementById("myModal").style.display = "none";
}