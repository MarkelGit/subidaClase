$(document).ready(function () {
  $('.modalButton').on("click", function(){
    var id=$(this).data("id");
    console.log(id);
    $("#Modal .modal-title").text("Datuak kargatzen");
    $("#Modal .modal-body").html('<div class="spinner-border text-danger" role="status"></div>');
});
});