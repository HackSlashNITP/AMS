import cv2
import numpy as np
# recognise()
# apply_watermark.py
import cv2

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
