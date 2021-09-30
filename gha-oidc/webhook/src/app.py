import flask
import json
from pprint import pp, pprint as pprint

app = flask.Flask(__name__)

@app.route("/webhook", methods=["POST"])
def webhook():
    """ webhook target for GH Actions """
    request_json_string = flask.request.get_data().decode("utf-8")
    with open("log.json", "w") as output_file:
        output_file.write(f"{request_json_string}\n")
    request_json_data = json.loads(request_json_string)
    pprint(request_json_data)

    return flask.Response(status=200)

@app.route("/", methods=["POST"])
def default():
    return flask.redirect("/webhook")

if __name__ == "__main__":
    app.run()
