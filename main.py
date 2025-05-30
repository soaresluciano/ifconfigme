from flask import Flask
import requests

app = Flask(__name__)

@app.route("/")
def show_ip():
    return requests.get("https://ifconfig.me/").text.strip()

@app.route("/all")
def show_all():
    data = requests.get("https://ifconfig.me/all").text
    return f"<pre>{data}</pre>"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)