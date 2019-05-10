// add an event listener to the document to run a function when the dom has loaded
document.addEventListener('DOMContentLoaded', () => addDurianToCartAjax())


var addDurianToCartAjax = function() {
    // select all the '.durian-form's and run a function on each of them
    document.querySelectorAll('.durian-form').forEach(form => {
        // add event listener which takes in a submit event
        form.addEventListener('submit', e => {
            // prevent the default event, which would reload the page (since form takes an action)
            console.log(e)
            e.preventDefault();
            // construct a json object to be submitted with the fetch request
            const requestData = {
                id: e.target[2].value,
                name: e.target[3].value,
                image_url: e.target[4].value,
                price_per_kg: e.target[5].value,
                weight: e.target[6].value
            }
            console.log(requestData)
            // do a post request to a route with an options object
            fetch('/shoppingcarts/cart', {
                method: 'POST', // or 'PUT'
                body: JSON.stringify(requestData), // data can be `string` or {object}!
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
                },
            })
            // first .then handles the response from server
            .then(response => {
                // console.log(response);
                // the response.body is in "readable stream", which needs to be handled in a following callback
                return response.json()
            })
            // catch any potential errors
            .catch(err => console.log(err))
            // if no errors, then run a callback. this callback changes the cart length span to match the current cart length (stored in the session)
            .then(json => document.getElementById('cart-length').innerHTML = json.length);
        })
    })
}