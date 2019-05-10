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
                e.target.parentNode.parentNode.remove();
                document.getElementById('cart-length').innerHTML = json.cart.length;
                document.getElementById("payment_amount").innerHTML = "$" + json.amount / 100;

            })
            .catch(err => console.log(err))
        })
    })



    document.querySelectorAll('.plus-btn').forEach(button => {

        button.addEventListener('submit', e => {

        console.log(e)
        e.preventDefault();

        const requestData = {
            id: e.target[2].value
        }
        console.log(requestData)

        fetch('/shoppingcarts/plus', {
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
                document.getElementById(`${e.target[2].value}-weight`).innerHTML = json.weight + "kg"
                document.getElementById(`${e.target[2].value}-total-price`).innerHTML = "$" + json.total_price / 100;
                document.getElementById("payment_amount").innerHTML = "$" + json.total_amount / 100;
            })
            .catch(err => console.log(err))
        })
    })


    document.querySelectorAll('.minus-btn').forEach(button => {

        button.addEventListener('submit', e => {

        console.log(e)
        e.preventDefault();

        const requestData = {
            id: e.target[2].value
        }
        console.log(requestData)

        fetch('/shoppingcarts/minus', {
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
                document.getElementById(`${e.target[2].value}-weight`).innerHTML = json.weight + "kg"
                document.getElementById(`${e.target[2].value}-total-price`).innerHTML = "$" + json.total_price / 100;
                document.getElementById("payment_amount").innerHTML = "$" + json.total_amount / 100;
            })
            .catch(err => console.log(err))
        })
    })
}