import streamlit as st
from PIL import Image
from facer import Person
from functools import lru_cache
import cv2

st.title("Matching")

def apply_watermark(image_path, text, output_path):
    image = cv2.imread(image_path)

    font = cv2.FONT_HERSHEY_SIMPLEX
    font_scale = 1
    font_thickness = 2
    font_color = (255, 255, 255)

    text_size = cv2.getTextSize(text, font, font_scale, font_thickness)[0]

    border_size = 50
    image_with_border = cv2.copyMakeBorder(image, border_size, border_size, border_size, border_size, cv2.BORDER_CONSTANT, value=(0, 0, 0))

    text_position = ((image_with_border.shape[1] - text_size[0]) // 2, border_size - 10)

    cv2.putText(image_with_border, text, text_position, font, font_scale, font_color, font_thickness)

    cv2.imwrite(output_path, image_with_border)
    print(f"Modified image saved to {output_path}")

@lru_cache(maxsize=None)
def get_persons():
    ##when database will be connected here we will fetch all persons information.
    persons = []
    persons.append(Person("dummy","9696","test_imgs/div.jpg"))
    return persons

persons = get_persons()
    
def recognize_person(image:Image):
    image.save("temp.jpg")
    for person in persons:
        result = person.recognise("temp.jpg")        
        if result is not None:
            print(result)
            info = result.name + " " + result.roll_no
            apply_watermark("temp.jpg", info, f'output_imgs/{info}.jpg')
            return ({'result': 'success', 'image_path': f'output_imgs/{info}.jpg','name':person.name,'roll_no':person.roll_no})
    
    return ({'result': 'failure', 'message': 'Not matched'}), 404

uploader = st.file_uploader("Upload image here")
if uploader:
    img = Image.open(uploader)
    details = recognize_person(img)
    st.write(details)