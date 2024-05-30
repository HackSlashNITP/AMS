import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class StudentPhotoWidget extends StatefulWidget {
  @override
  _StudentPhotoWidgetState createState() => _StudentPhotoWidgetState();
}

class _StudentPhotoWidgetState extends State<StudentPhotoWidget> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final containerSize = screenWidth * 0.2; 
    final innerContainerSize = containerSize * 0.8; 
    final opacityValue = 0.64;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary,size: screenWidth*0.075,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Student’s Photo',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.7,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: screenWidth * 0.9,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                image: _imageFile != null
                    ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                          image: AssetImage(
                    AppImages.student_dummy_image,
                  ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
            
                
                  child: GestureDetector(
                    onTap: _pickImage,
                    child:Stack(
  children: [
    Container(
      width: containerSize,
                      height: containerSize,
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(43.5),
      ),
    ),
    Positioned(
   top: (containerSize - innerContainerSize) / 2,
   left: (containerSize - innerContainerSize) / 2,
      child: Opacity(
        opacity: 0.64,
        child: Container(
       width: innerContainerSize,
       height: innerContainerSize,
          decoration: BoxDecoration(
            color: AppColors.black, 
            borderRadius: BorderRadius.circular(43.5),
          ),
        ),
      ),
    ),
  ],
)
                  ),
            ),
             Row(mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(width: screenWidth*0.2,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.all(6),
                        
                         
                           child:  Align(
                            alignment: Alignment.center,
                             child: Text(
                                'Next',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.6,
                                  color: Colors.white,
                                ),
                              ),
                           ),
                          
                      ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}
