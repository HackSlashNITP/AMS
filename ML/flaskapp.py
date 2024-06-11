from facer import Person, DeepModel
from flask import Flask, request, jsonify, render_template
from textonimg import apply_watermark
from flask_cors import CORS
from functools import lru_cache
from google.cloud import storage
import firebase_admin
from firebase_admin import credentials
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "ML/key.json"

cred = credentials.Certificate("ML/key.json")
firebase_admin.initialize_app(cred)

def list_files(bucket_name):
    """List all files in GCP bucket."""
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blobs = bucket.list_blobs()
    files = []
    for blob in blobs:
        files.append(blob.name)
    return files

app = Flask(__name__)
CORS(app)  

model = DeepModel()

@lru_cache(maxsize=None)
def get_persons():
    persons = []
    bucket_name = "ams-app-4a0ca.appspot.com"
    files = list_files(bucket_name)
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    print(files)
    for file in files:
        #download to images/ directory
        blob = bucket.blob(file)
        blob.download_to_filename(f"ML/images/{file}.png")
        name = file
        roll_no = file
        person = Person(name, roll_no, f"ML/images/{file}.png")
        persons.append(person)
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