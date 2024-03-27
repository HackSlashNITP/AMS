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
  Uint8List? _image;

  void SelectImage() async {
    Uint8List img = await ImagePickHelper().pickimage(ImageSource.camera);
    _image = img;
  }

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
        body: Column(
          children: [
            Card(
              child: ListTile(
                  title: const Text("Student's Photo"),
                  subtitle: const Text('Upload Your photo'),
                  trailing: (_image == null)
                      ? Icon(Icons.camera_alt_outlined)
                      : Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                  onTap: () => SelectImage()),
            ),
            Card(
              child: ListTile(
                  title: const Text("Professor's Photo"),
                  subtitle: const Text('Upload Professor photo'),
                  trailing: (_image == null)
                      ? Icon(Icons.camera_alt_outlined)
                      : Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                  onTap: () => SelectImage()),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text('Mark Attendance'),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
