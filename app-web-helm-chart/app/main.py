from flask import Flask, request
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def hello():
    if request.args.get("time") == "now":
        return {"time": datetime.now().isoformat()}
    if request.args.get("whoami") == "1":
        return {"ip": request.remote_addr}
    return "Hello, World!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
