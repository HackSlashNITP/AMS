# -*- coding: utf-8 -*-


import face_recognition
# import os

class Person:
    def __init__(self, name, roll_no, image_path):
        self.name = name
        self.roll_no = roll_no
        self.image_path = image_path

def recognise(students, roll_no, image_path):
  s = students[roll_no]
  known_image = face_recognition.load_image_file(s.image_path)
  unknown_image = face_recognition.load_image_file(image_path)
  known_encoding = face_recognition.face_encodings(known_image)[0]
  unknown_encoding = face_recognition.face_encodings(unknown_image)[0]
  results = face_recognition.compare_faces([known_encoding], unknown_encoding)

  if results[0]:
    return s
  return None

# if __name__ == '__main__':
#    s = Person("Divyansh", "2206015", os.getcwd() + "/images/div1.jpg")
#    students = {
#       s.roll_no: s
#    }
#    result = recognise(students, s.roll_no, os.getcwd() + "/images/div2.jpg")
#    print(result.name)
#    print(result.roll_no)

