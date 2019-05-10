document.addEventListener('DOMContentLoaded', () => shoppingCartAjax())


var shoppingCartAjax = function() {

    document.querySelectorAll('.remove-btn').forEach(button => {

        button.addEventListener('submit', e => {

        console.log(e)
        e.preventDefault();

        const requestData = {
            id: e.target[2].value
        }
        console.log(requestData)

        fetch('/shoppingcarts/delete', {
            method: 'POST',
            body: JSON.stringify(requestData),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
        })

        .then(response => {
            return response.json()
        })
            .then(json => {
                               console.log(json);
                e.target.parentNode.parentNode.remove();
                document.getElementById('cart-length').innerHTML = json.cart.length;
                document.getElementById("payment_amount").innerHTML = "$" + json.amount / 100;

            })
            .catch(err => console.log(err))
        })
    })
}