import cv2
import numpy as np

# Load the image
image = cv2.imread("test_imgs\subhdiv.jpg")  # Replace "subhdiv.jpg" with the path to your image

# Define the text and font properties
text = "Abdul Subhan - 2206270"
font = cv2.FONT_HERSHEY_SIMPLEX
font_scale = 1
font_thickness = 2
font_color = (255, 255, 255)  # White color in BGR format

# Get the size of the text
text_size = cv2.getTextSize(text, font, font_scale, font_thickness)[0]

# Add black borders around the image
border_size = 50
image_with_border = cv2.copyMakeBorder(image, border_size, border_size, border_size, border_size, cv2.BORDER_CONSTANT, value=(0, 0, 0))

# Calculate the position to place the text on the top border
text_position = ((image_with_border.shape[1] - text_size[0]) // 2, border_size - 10)  # Adjusted for proper placement

# Put the text on the image with borders
cv2.putText(image_with_border, text, text_position, font, font_scale, font_color, font_thickness)

# Save the modified image to a file
output_path = "output_imgs\modified_image.jpg"
cv2.imwrite(output_path, image_with_border)

print(f"Modified image saved to {output_path}")
