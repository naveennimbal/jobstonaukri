/**
 * Created by naveen on 18/06/16.
 */
$(document).ready(function(){

   // alert("dfdshf");

  /*  $("#addToCart").click(function(){

       // alert("dfdshf");
        $("#resform").submit(function(){
            console.log(this);
            alert("for submit");
            return false;
        })
    })
    */




    $("#resform").submit(function(){
        console.log(this);
       // alert("for ssssubmit");
        if($('[name="price"]').is(':checked')){
            //alert("it is checked now ");
            amount = $('[name="price"]:checked').val();
            alert(amount);
            var request = $.ajax({
                url: "/cart/add",
                method: "POST",
                data: { price : amount },
                //dataType: "html"
            });

            request.done(function( msg ) {
                $( "#log" ).html( msg );
            });

            request.fail(function( jqXHR, textStatus ) {
                alert( "Request failed: " + textStatus );
            });

        } else {
            alert("Please choose a package ");
        }

        return false;
    })

});

