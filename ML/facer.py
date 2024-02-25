
import face_recognition

class Person:
  def __init__(self, name, roll_no, image_path):
    self.name = name
    self.roll_no = roll_no
    self.image_path = image_path
    self.image = face_recognition.load_image_file(self.image_path)
    self.encoding = face_recognition.face_encodings(self.image)[0]

  def recognise(self, image_path):
    unknown_image = face_recognition.load_image_file(image_path)
    unknown_encoding = face_recognition.face_encodings(unknown_image)[0]
    results = face_recognition.compare_faces([self.encoding], unknown_encoding)

    if results[0]:
      return self
    return None
