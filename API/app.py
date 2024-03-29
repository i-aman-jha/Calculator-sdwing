
from flask import Flask, request, jsonify


app = Flask(__name__)

@app.route('/')
def Calculator():
    return "This is a flask app for calculation. Get answer of query by typing expression in url for example |https://calculator-flask-app-wvii.onrender.com/evaluate?query=your expression|"

@app.route('/evaluate', methods=['GET'])
def evaluate():
    query = str(request.args['query'])
    # query = request.args.get('query')
    if query is None:
        return jsonify({'error': 'Query parameter not provided'}), 400

    query = query.replace(' ', '+') 
    try:
        result = eval(query)
        return jsonify({'result': result})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == "__main__":
    app.run(debug=True)

