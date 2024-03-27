import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/helpers/pick_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({super.key});

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  Uint8List? _image1;
  Uint8List? _image2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Mark Attendance'),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                      title: const Text("Student's Photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      subtitle: const Text('Upload Your photo',
                          style: TextStyle(fontSize: 13)),
                      trailing: (_image1 == null)
                          ? Icon(Icons.camera_alt_outlined)
                          : Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                      onTap: () async {
                        Uint8List img = await ImagePickHelper()
                            .pickimage(ImageSource.camera);
                        setState(() {
                          _image1 = img;
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                      title: const Text("Professor's Photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      subtitle: const Text('Upload Professor photo',
                          style: TextStyle(fontSize: 13)),
                      trailing: (_image2 == null)
                          ? Icon(Icons.camera_alt_outlined)
                          : Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                      onTap: () async {
                        Uint8List img = await ImagePickHelper()
                            .pickimage(ImageSource.camera);
                        setState(() {
                          _image2 = img;
                        });
                      }),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text('Mark Attendance'),
                ),
              ),
            ],
          ),
        ));
  }
}
