var urlOrigin = window.location.origin;
var urlREST = urlOrigin + "csp/irisapp/api";

$(document).ready(function () {

    $("#btnUpload").click(function () {
        getValues();
    });


    function getValues() {

        /*
        $.ajax({
            url: urlREST + "/import",
            type: "post",
            dataType: 'json',
            processData: false, // important
            contentType: false, // important
            data: formData,
            success: function (text) {
                alert(text);
                if (text == "success") {
                    alert("Your image was uploaded successfully");
                }
            },
            error: function () {
                alert("An error occured, please try again.");
            }
        });
        */
    }

    var jsonfile = {
        "jsonarray": [{
            "name": "Joe",
            "age": 12
        }, {
            "name": "Tom",
            "age": 14
        }]
    };


});