# extract_text.py
import cv2
import pytesseract

def extract_text(image_path):
    image = cv2.imread(image_path)

    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    extracted_text = pytesseract.image_to_string(gray_image)

    print("Extracted Text:")
    print(extracted_text)
