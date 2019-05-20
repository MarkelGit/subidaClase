$(document).ready(function () {
    /*$("#confirm-purchase_tarjeta").attr("disabled", true);*/
    $("#metodoDePago").change(function () {
        var id=$(this).val();
        console.log(id);
        if (id==1) {
            var owner=$("#owner").val();
            var cvv=$("#cvv").val();
            var cardNumber=$("#cardNumber").val();
            console.log(owner);
            console.log(cvv);
            console.log(cardNumber);
            $("#contra_reembolso").fadeOut();
            $(".creditCardForm").slideDown();  
            /*if(owner !== "" && cvv !== "" && cardNumber !== ""){
                console.log("aqui estoy");
                $("#confirm-purchase_tarjeta").attr("disabled", false); 
            }*/
        }
        else{
            $(".creditCardForm").slideUp();
            $("#contra_reembolso").fadeIn();
        }
    });
});