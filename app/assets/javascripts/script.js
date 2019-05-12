window.onload = function() {
    var paymentCheckoutRequestHandler = function() {
        const stripe = Stripe('pk_test_pm5q2zjDrbbPI7ZEDX1sWbNV00smaYlfgy');

        stripe.redirectToCheckout({
            sessionId: this.responseText,

            }).then((result) => {
              // If `redirectToCheckout` fails due to a browser or network
              // error, display the localized error message to your customer
              // using `result.error.message`.
            });
    };

    var addressSearchRequestHandler = function() {
        if (JSON.parse(this.responseText).results.length > 0) {
            document.querySelector('#delivery_address').value = JSON.parse(this.responseText).results[0].ADDRESS.toLowerCase();
        } else {
            document.querySelector('#delivery_address').value = "Please enter a valid postal code"
        }
    };

    var paymentEventHandler = function() {
        var request = new XMLHttpRequest();

        request.addEventListener("load", paymentCheckoutRequestHandler);
        request.open("GET", `/orders/payment`);

        request.send();
    };

    var postalCodeEventHandler = function() {
        var request = new XMLHttpRequest();
        var postalCode = document.querySelector('#delivery_postal_code').value

        if (postalCode.length === 6) {
            request.addEventListener("load", addressSearchRequestHandler);

            request.open("GET", `https://developers.onemap.sg/commonapi/search?searchVal=${ postalCode }&returnGeom=N&getAddrDetails=Y`);

            request.send();
        }
    };

    if (document.querySelector('#payment') !== null) {
        document.querySelector('#payment').addEventListener('click', paymentEventHandler)
    }

    if (document.querySelector('#delivery_postal_code') !== null) {
        document.querySelector('#delivery_postal_code').addEventListener('keyup', postalCodeEventHandler)
    }

    $(function () {
      $('[data-toggle="popover"]').popover()
    })

    $('.popover-dismiss').popover({
      trigger: 'focus'
    })
};