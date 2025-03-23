from flask import Flask, request, jsonify
import xgboost as xgb
import pandas as pd

app = Flask(__name__)
model = xgb.Booster({'nthread': 4})
# Adjust the path to where your model is stored within the models directory
model.load_model('models/model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    df = pd.DataFrame(data, index=[0])
    dmatrix = xgb.DMatrix(df)
    prediction = model.predict(dmatrix)
    output = int(prediction[0])
    return jsonify({'diabetes_prediction': output})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

