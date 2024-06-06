import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_match.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ImageData1 with ChangeNotifier {
  File? _imageFile;

  File? get imageFile => _imageFile;

  set imageFile(File? value) {
    _imageFile = value;
    notifyListeners();
  }
}

class TeacherPhotoWidget extends StatefulWidget {
  @override
  _TeacherPhotoWidgetState createState() => _TeacherPhotoWidgetState();
}

class _TeacherPhotoWidgetState extends State<TeacherPhotoWidget> with ChangeNotifier{
  final ImagePicker _imageFile = ImagePicker();
  XFile? pickedFile;
  Future<void> _pickImage() async {
    pickedFile = await _imageFile.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        Provider.of<ImageData1>(context, listen: false).imageFile =
            File(pickedFile!.path);
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
    final image = pickedFile;
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
                'Professor’s Photo',
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
                image: image != null
                    ? DecorationImage(
                        image: XFileImage(image),
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
                 GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MatchWidget()));
                    },
                   child: Container(width: screenWidth*0.2,
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
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}