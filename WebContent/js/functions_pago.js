$(document).ready(function () {
    totalFactura = localStorage.getItem('totalStorage');
    localStorage.setItem("totalFactura", JSON.stringify(totalFactura));
    
    carritoFactura = localStorage.getItem('carrito');
    localStorage.setItem("carritoFactura", JSON.stringify(carritoFactura));
    
    $(".lineasFactura").append("<input type='text' name='totalFactura' value='"+totalFactura+"'>");
    $(".lineasFactura").append("<input type='text' name='carritoFactura' value='"+carritoFactura+"'>");

    $("#metodoDePago").change(function () {
        var id = $(this).val();

        if (id == 1) {
            $("#contra_reembolso").fadeOut();
            $(".creditCardForm").slideDown();
        }else if (id == 2){
            $(".creditCardForm").slideUp();
            $("#contra_reembolso").fadeIn();
        }else {
            $("#contra_reembolso").fadeOut();
            $(".creditCardForm").slideUp();
        }
    });
    
    $("#owner").on("keyup", check);
    $("#cvv").on("keyup", check);
    $("#cardNumber").on("keyup", check);
    $("#mes").on("change", check);
    $("#year").on("change", check);
});

function check() {
    var owner = $("#owner").val();
    var cvv = $("#cvv").val();
    var cardNumber = $("#cardNumber").val();
    var mes = $("#mes").val();
    var year = $("#year").val();

    if(owner !== "" && cvv !== "" && cardNumber !== "" && mes !== "" && year !== "") {
        $("#confirm-purchase_tarjeta").attr("disabled", false); 
    }else {
        $("#confirm-purchase_tarjeta").attr("disabled", true);
    }
}