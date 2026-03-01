from flask import Flask, jsonify
import json

app = Flask(__name__)

@app.route("/shades")
def shades():
    with open("shades.json") as f:
        return jsonify(json.load(f))

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
