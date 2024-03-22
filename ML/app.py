from facer import Person
from flask import Flask, request, jsonify
from textonimg import apply_watermark
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  

def get_persons():
    persons = []
    return persons

persons = get_persons

@app.route('/recognize', methods=['POST'])
def recognize_person():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    file.save("temp.jpg")

    for person in persons:
        result = person.recognise("temp.jpg")        
        if result is not None:
            info = result.name + " " + result.roll_no
            apply_watermark("temp.jpg", info, f'output_imgs/{info}.jpg')
            return jsonify({'result': 'success', 'image_path': f'output_imgs/{info}.jpg'})
    
    return jsonify({'result': 'failure', 'message': 'Not matched'}), 404

if __name__ == '__main__':
    app.run(debug=True)