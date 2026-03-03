# CORS (Cross-Origin Resource Sharing)

- __CORS (Cross-Origin Resource Sharing)__ is browser security mechanism that prevent that a web page call a resource from an API from another origin.
- The __CORS__ mechanism protects the user from malicious sites that try to access resources from another origin.

### APIs without CORS verification (Threat)


<img src="../cors-threat.png" />

- Without __CORS__ verification a malicious site can use the credentials storage in broser to perform requests to the API.


### APIs with CORS verification enabled (Safe)

<img src="../cors-enabled.png" />

- With __CORS__ verification enabled the browser will prevent the malicious site read responses from the API.


### How CORS works?

- The CORS mechanism works in two steps:
1. The broser send a __preflight request__ to ask to API if the site origin is accepted. The api answer with a Access-Control-Allow-Origin header with the origin allowed.
2. If the origin is allowed the browser send the real request.

<img src="../cors-working.png" />

- If a malicious site try to perform a preflight request to the API, the value of __Access-Control-Allow-Origin__ header will be different from the __malicious origin__ and the browser wont read the response from real request and will throw a __CORS error__.

#### Code

- Below is an example of a simple API that implements CORS verification.

**page.html**

```html
<!DOCTYPE html>
<html lang="en">
<body>
    <h1>HTTP Request Demo</h1>
    <button onclick="makeRequest()">Make Request</button>
    <div id="result"></div>

    <script>
        function makeRequest() {
            fetch('http://localhost:5000/', {method: "PATCH", headers: {'Test': 'Example'}})
                .then(response => response.json())
                .then(data => {
                    document.getElementById('result').innerHTML = JSON.stringify(data, null);
                })
                .catch(error => {
                    document.getElementById('result').innerHTML = 'Error: ' + error.message;
                });
        }
    </script>
</body>
</html>
```

**api.py**

```python
from flask import Flask, jsonify


app = Flask(__name__)


@app.after_request
def add_global_headers(response):
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:8000'
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type,Authorization,Test'
    response.headers['Access-Control-Allow-Methods'] = 'PATCH,OPTIONS'
    return response


@app.route('/', methods=['GET'])
def get_data():
    return jsonify({"get": "success"})


@app.route('/', methods=['POST'])
def post_data():
    return jsonify({"post": "success"})


@app.route('/', methods=['PATCH'])
def patch_data():
    return jsonify({"patch": "success"})


if __name__ == '__main__':
    app.run(debug=True, port=5000)
```