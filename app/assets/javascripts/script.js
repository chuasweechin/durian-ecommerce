window.onload = function() {
    var responseHandler = function() {
        const stripe = Stripe('pk_test_pm5q2zjDrbbPI7ZEDX1sWbNV00smaYlfgy');

        stripe.redirectToCheckout({
            sessionId: this.responseText,

            }).then((result) => {
              // If `redirectToCheckout` fails due to a browser or network
              // error, display the localized error message to your customer
              // using `result.error.message`.
            });
    };

    var paymentEventHandler = function() {
        var request = new XMLHttpRequest();
        request.addEventListener("load", responseHandler);

        // ready the system by calling open, and specifying the url
        request.open("GET", "/orders/payment");

        // send the request
        request.send();
    };

    document.querySelector('.payment').addEventListener('click', paymentEventHandler)
};