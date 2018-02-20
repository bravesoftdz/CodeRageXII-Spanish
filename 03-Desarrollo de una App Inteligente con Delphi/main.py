import pandas as pd
import json
from sklearn.externals import joblib
from flask import Flask, request, render_template, jsonify

app = Flask(__name__)

model_file_name = 'model.pkl'
clf = joblib.load(model_file_name)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/predict',methods=['POST'])
def predict():
    if clf:
        data = request.data
        query = pd.DataFrame(json.loads(data))
        prediction = list(clf.predict(query))
        return jsonify({'prediction': prediction})
    return 'fails'

if __name__ == '__main__':
    app.run()