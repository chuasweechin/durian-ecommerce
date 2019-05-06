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

    var paymentEventHandler = function() {
        var request = new XMLHttpRequest();

        request.addEventListener("load", paymentCheckoutRequestHandler);
        request.open("GET", "/orders/payment");

        request.send();
    };

    document.querySelector('.payment').addEventListener('click', paymentEventHandler)
};