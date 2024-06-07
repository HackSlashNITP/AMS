from facer import Person, DeepModel
from flask import Flask, request, jsonify, render_template
from textonimg import apply_watermark
from flask_cors import CORS
from functools import lru_cache

app = Flask(__name__)
CORS(app)  

model = DeepModel()

@lru_cache(maxsize=None)
def get_persons():
    ##when database will be connected here we will fetch all persons information.
    persons = []
    persons.append(Person("dummy","9696","test_imgs/div.jpg"))
    return persons

persons = get_persons()

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

    
@app.route('/recognize', methods=['POST'])
def recognize_person():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    file.save("temp.jpg")

    for person in persons:
        result = person.recognise("temp.jpg", model)        
        if result is not None:
            print(result)
            info = result.name + " " + result.roll_no
            apply_watermark("temp.jpg", info, f'output_imgs/{info}.jpg')
            return jsonify({'result': 'success', 'image_path': f'output_imgs/{info}.jpg','name':person.name,'roll_no':person.roll_no})
    
    return jsonify({'result': 'failure', 'message': 'Not matched'}), 404

if __name__ == '__main__':
    app.run(debug=True)