import cv2
import pytesseract

# Load the image
image = cv2.imread("output_imgs/modified_image.jpg")  # Replace "image_with_text.jpg" with the path to your image

# Convert the image to grayscale
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Use pytesseract to extract text
extracted_text = pytesseract.image_to_string(gray_image)

# Print the extracted text
print("Extracted Text:")
print(extracted_text)
