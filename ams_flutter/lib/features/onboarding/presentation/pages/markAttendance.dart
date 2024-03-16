import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_icons.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/bottom_navbar.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_string.dart';

class MarkAttendance extends StatefulWidget {
  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  late Size mq;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context),
              SizedBox(height: 16.0),
              _buildDropDown(context),
              // SizedBox(height: 16),
              TextFieldController(
                  textEditingController: TextEditingController(),
                  hinttext: "SearchStudent",
                  textInputType: TextInputType.name,
                  prefixIcon: Icon(Icons.search),
                  borderRadius: 40),
              StudentList(
                students: [
                  Student(
                      name: 'John Doe',
                      rollno: '2206201',
                      photoUrl:
                          'https://randomuser.me/api/portraits/men/1.jpg'),
                  Student(
                      name: 'Jane Smith',
                      rollno: '2206201',
                      photoUrl:
                          'https://randomuser.me/api/portraits/women/2.jpg'),
                  Student(
                      name: 'Michael Johnson',
                      rollno: '2206201',
                      photoUrl:
                          'https://randomuser.me/api/portraits/men/3.jpg'),
                  Student(
                      name: 'Emily Davis',
                      rollno: '2206201',
                      photoUrl:
                          'https://randomuser.me/api/portraits/women/4.jpg'),
                  // Add more students as needed
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.arrow_image,
          width: mq.width * 0.06,
          height: mq.width * 0.06,
        ),
        Image.asset(
          AppImages.bell_image,
          width: mq.width * 0.06,
          height: mq.width * 0.06,
        ),
      ],
    );
  }

  Widget _buildDropDown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton('B.Tech'),
        _buildButton('Mechanical-B(2026)'),
        _buildButton('13:30PM-14:30PM'),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final String photoUrl;
  final String rollno;

  Student({required this.name, required this.rollno, required this.photoUrl});
}

class StudentList extends StatelessWidget {
  final List<Student> students;

  const StudentList({required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: students.length,
      itemBuilder: (context, index) {
        return _buildListItem(students[index]);
      },
    );
  }

  Widget _buildListItem(Student student) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(student.photoUrl),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.name),
              Text(student.rollno),
            ],
          ),
          BuildButton(color: Colors.green,text: Text("Present")),
          BuildButton(color: Colors.red,text: Text("Absent")),
        ],
      ),
    );
  }
  
}
class BuildButton extends StatelessWidget {
  final Text text;
  final Color color;
  const BuildButton({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: color, 
          borderRadius: BorderRadius.circular(5),
        ),
        child:Text(
          text.data!, 
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


