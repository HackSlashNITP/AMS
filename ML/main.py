from facer import Person

from textonimg import apply_watermark
# Create a Person object
s = Person("Divyansh", "2206015", "test_imgs/div.jpg")
PATH = "images/div1.jpg"
# Use the recognise method
result = s.recognise(PATH)

if result is not None:
    print(result.name)
    print(result.roll_no)
    info = result.name +" " + result.roll_no
    apply_watermark(PATH, info, 'output_imgs/divyansh.jpg')
else: 
    print('Not matched')



# Now you can use apply_watermark in your main.py file