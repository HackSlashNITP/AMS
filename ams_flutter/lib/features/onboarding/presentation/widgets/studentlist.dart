import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final String photoUrl;
  final String rollno;

  Student({required this.name, required this.rollno, required this.photoUrl});
}

class StudentList extends StatefulWidget {
  final List<Student> students;

  const StudentList({required this.students});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.students.length,
      itemBuilder: (context, index) {
        return _buildListItem(widget.students[index]);
      },
    );
  }

  Widget _buildListItem(Student student) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(8.0), 
      ),
      padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // width: ,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(student.photoUrl),
                  ),
                    SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.name, style: TextStyle(color:Colors.black ,fontWeight: FontWeight.w500,fontSize: 16.8),),
                Text("Roll No-"+student.rollno, style: TextStyle(color:Colors.black ,fontWeight: FontWeight.w500,fontSize: 10.2),),
              ],
            ),
                ],
              ),
            ),
          
            Container(
              child: Row(
                children: [
                  BuildButton(color: Colors.green, text: Text("Present")),
                  SizedBox(width: 16),
                    BuildButton(color: Colors.red, text: Text("Absent")),
                ],
              )),
          
          ],
        ),
      ),
    );
  }
}

class BuildButton extends StatefulWidget {
  final Text text;
  final Color color;
  final double borderRadius;
  const BuildButton({
    Key? key,
    required this.text,
    required this.color,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        ),
        child: Text(
          widget.text.data!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
