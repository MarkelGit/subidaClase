$(document).ready(function () {
    carritoFactura = localStorage.getItem('carrito');
    localStorage.setItem("carritoFactura", JSON.stringify(carritoFactura));
    
    $(".lineasFactura").html("<input type='text' name='carritoFactura' value='"+carritoFactura+"'>");

    $("#metodoDePago").change(function () {
        var id = $(this).val();
        console.log(id);
        if (id == 1) {
            $("#contra_reembolso").fadeOut();
            $(".creditCardForm").slideDown();
        }
        else {
            $(".creditCardForm").slideUp();
            $("#contra_reembolso").fadeIn();
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
    console.log(owner);
    console.log(cvv);
    console.log(cardNumber);
    console.log(mes);
    console.log(year);
    if(owner !== "" && cvv !== "" && cardNumber !== "" && mes !== "00" && year !== "16") {
        $("#confirm-purchase_tarjeta").attr("disabled", false); 
    }else {
        $("#confirm-purchase_tarjeta").attr("disabled", true);
    }
}