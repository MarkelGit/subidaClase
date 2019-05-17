$(document).ready(function () {
    $("#metodoDePago").change(function () {
        var id=$(this).val();
        console.log(id);
        if (id==1) {
            $(".creditCardForm").slideDown();
        }
        else{
            $(".creditCardForm").slideUp();
        }
    });
});