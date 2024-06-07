
import os
import numpy as np
from tensorflow.keras.applications.mobilenet import MobileNet, preprocess_input
from tensorflow.keras.preprocessing import image as process_image
from tensorflow.keras.utils import Sequence
from tensorflow.keras.layers import GlobalAveragePooling2D
from tensorflow.keras import Model
from flask import jsonify

THRESHOLD = 0.7

class DeepModel():
    def __init__(self):
        self.model = self.define_model()
        #save modelfile
        self.model.save('model.h5')
        print("Saved to model.h5")
        print('Loading MobileNet.')
        print()

    @staticmethod
    def define_model():
        base_model = MobileNet(weights='imagenet', include_top=False, input_shape=(224, 224, 3))
        output = base_model.layers[-1].output
        output = GlobalAveragePooling2D()(output)
        model = Model(inputs=base_model.input, outputs=output)
        return model

    @staticmethod
    def preprocess_image(path):
        img = process_image.load_img(path, target_size=(224, 224))
        x = process_image.img_to_array(img)
        # x = np.expand_dims(x, axis=0)
        x = preprocess_input(x)
        return x

    @staticmethod
    def cosine_distance(input1, input2):
        # return np.dot(input1, input2) / (np.linalg.norm(input1) * np.linalg.norm(input2))
        return np.dot(input1, input2.T) / \
                np.dot(np.linalg.norm(input1, axis=1, keepdims=True), \
                        np.linalg.norm(input2.T, axis=0, keepdims=True))

    def extract_feature(self, img_arr):
        features = self.model.predict(img_arr)
        return features
    
class Person:
  def __init__(self, name, roll_no, image_path):
    self.name = name
    self.roll_no = roll_no
    self.image_path = image_path

  def recognise(self, image_path, model):
    self.image = model.preprocess_image(self.image_path)
    self.image = np.expand_dims(self.image, axis=0)
    self.img_features = model.extract_feature(self.image)

    self.unknown_image = model.preprocess_image(image_path)
    self.unknown_image = np.expand_dims(self.unknown_image, axis=0)
    self.unknown_img_features = model.extract_feature(self.unknown_image)

    if model.cosine_distance(self.img_features, self.unknown_img_features) > THRESHOLD:
      return self
    return None


# model = DeepModel()
# person = Person("dummy","9696","ML/test_imgs/div.jpg")
# person.recognise("ML/temp.jpg", model)
