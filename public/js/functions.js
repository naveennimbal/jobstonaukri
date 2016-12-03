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
        //console.log(this);
       // alert("for ssssubmit");
        if($('[name="price"]').is(':checked')){
            //alert("it is checked now ");
            amount = $('[name="price"]:checked').val();
            //alert(amount);
            optionChecked = $('[name="price"]:checked');
            //console.log(optionChecked);
            optionDataString  = optionChecked.data('optiondata');
            //console.log(optionDataString);
            optionArray = optionDataString.split('-#-');

           // console.log(optionChecked.data('optiondata'),"Option String");
           // console.log(optionArray);
            var request = $.ajax({
                url: "/cart/add",
                method: "POST",
                data: { price : amount,optionId:optionArray[0],serviceId:$("#serviceId").val() },
                //dataType: "html"
            });

            request.done(function( msg ) {
                if(msg.status=="notLogin"){
                    $("#loginModal").modal('show');
                }
                if(msg.status=="exist"){
                    $("#statusMessage").html("This Package already exist in your cart");
                    $("#statusModal").modal('show');
                    setTimeout("hideStatusModal()",3000);
                }
                if(msg.status=="added"){
                    $("#statusMessage").html("Successfully added to your cart");
                    $("#statusModal").modal('show');
                    setTimeout("hideStatusModal()",3000);
                }

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



function addtoCart(ele){
    //alert("it is checked now ");
    //console.log(ele);
    amount = $(ele).val();
    //alert(amount);
    //optionChecked = $('[name="price"]:checked');
   // console.log(optionChecked);
    optionDataString  = $(ele).data('optiondata');
    //console.log(optionDataString);
    optionArray = optionDataString.split('-#-');
    dateAdded = $.now();

    // console.log(optionChecked.data('optiondata'),"Option String");
    // console.log(optionArray,"optionArray");
    var request = $.ajax({
        url: "/cart/add",
        method: "POST",
        data: { price : amount,optionId:optionArray[0],serviceId:optionArray[2],"dateAdded":dateAdded },
        beforeSend:function(){
            showLoader("added");
        },
        cache:false
        //dataType: "html"
    });

    request.done(function( msg ) {
        if(msg.status=="notLogin"){
            $("#loginModal").modal('show');
        }
        if(msg.status=="exist"){
            $("#statusMessage").html("This Package already exist in your cart");
            $("#statusModal").modal('show');
            setTimeout("hideStatusModal()",1000);
        }
        if(msg.status=="added"){
            $("#statusMessage").html("Successfully added to your cart");
            $("#statusModal").modal('show');
            addCartTableRow(ele);
            setTimeout("hideStatusModal()",1000);

        }

    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed: " + textStatus );
    });
    return false;
}

function addCartTableRow(ele){
   // console.log($(ele).parent().parent().parent(),"eeee");
    //console.log(ele);
    price = $(ele).val();
    optionDataString  = $(ele).data('optiondata');
    //console.log(optionDataString,"OptionString");
    optionArray = optionDataString.split('-#-');
    //console.log(optionDataString,"OptionArray");

    serviceString = optionArray[3];
    if(optionArray[1]!="" || optionArray[1]!=" "){
        serviceString += "( "+ optionArray[1]+" )";
    }
    serviceOptionId = optionArray[0];
    optionTitle = optionArray[1];
    serviceId = optionArray[2];


    html = "<tr class='cartTableRow'><td class='cartTableCell'> ";
    html += "<span style='margin-left: 1em;'>"+serviceString+"</span></td> ";
    html += "<td class='cartTableCell'>  "+price+"</td><td class='cartTableCell'>";
    html += "<span style='color: red'><a href='#' data-price='"+price+"' data-optiondata ='"+serviceOptionId+"-#-"+optionTitle+"-#-"+serviceId+" onclick='removePackage(this)' onclick='removePackage(this)'>X </a></span>";
    html += "</td></td></tr>";

    $('#cartTable').append(html);
    elementRemove = $(ele).closest('tr');
    //elementRemove = $(elementRemove).closest('tr');
    //console.log(elementRemove);
    totalAmount = $("#totalAmount").text();
    //console.log(totalAmount);
    totalAmount = parseInt(totalAmount) + parseInt(price);
    $("#totalAmount").text(totalAmount);
    $("#totalAmountForm").val(totalAmount);
    //$(elementRemove).hide('slow');

}


function removePackage(ele){
    totalAmount = 0;
    //console.log(ele.closest("tr"));
    price = $(ele).data('price');
    //console.log($(ele).data('price'));

    optionDataString  = $(ele).data('optiondata');
    //console.log(optionDataString,"OptionString");
    optionArray = optionDataString.split('-#-');
    //console.log(optionDataString,"OptionArray");


    var request = $.ajax({
        url: "/cart/delete",
        method: "POST",
        data: { optionId:optionArray[0],serviceId:optionArray[2]},
        beforeSend:function(){
            showLoader("removed");
        },
        cache:false
        //dataType: "html"
    });

    request.done(function( msg ) {
        //console.log(msg);

        if(msg.data.status=="success"){
            $("#statusMessage").html("Packed Removed from Cart");
            $("#statusModal").modal('show');
            $(ele).closest('tr').hide("slow");
            setTimeout("hideStatusModal()",1000);

            elementRemove = $(ele).closest('tr');
            //elementRemove = $(elementRemove).closest('tr');
            //console.log(elementRemove);
            totalAmount = $("#totalAmount").text();
            //console.log(totalAmount,"totalAmount");
            totalAmount = parseInt(totalAmount) -  parseInt(price);
            //console.log(price,"Price");
            $("#totalAmount").text(totalAmount);
            $("#totalAmountForm").val(totalAmount);
        }


    });



    //$(elementRemove).hide('slow');

}

function hideStatusModal(){
    $('#statusModal').modal('hide');
}

function showLoader(action){
    $("#statusMessage").html("Packed "+action+" from Cart");
    $("#statusModal").modal('show');
}