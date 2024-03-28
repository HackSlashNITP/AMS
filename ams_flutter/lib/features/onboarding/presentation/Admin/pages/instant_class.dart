import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_string.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:flutter/material.dart';

class InstantClassCreation extends StatefulWidget {
  @override
  _InstantClassCreationState createState() => _InstantClassCreationState();
}

class _InstantClassCreationState extends State<InstantClassCreation> {
  String? _selectedClassroom;
  String? _selectedDay;
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
            color: AppColors.tabBackgroundColor,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CREATE_INSTANT_CLASS,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: ENTER_SUB_CODE,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedClassroom,
                items: AppInfo.classrooms.map((classroom) {
                  return DropdownMenuItem<String>(
                    value: classroom,
                    child: Text(classroom),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedClassroom = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: CLASSROOM,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedDay,
                items: AppInfo.days.map((day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDay = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: DAY,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedTime,
                items: AppInfo.times.map((time) {
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTime = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: SELECT_TIME,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        // Add functionality for submit button
                      },
                      child: Text(
                        SUBMIT_BUTTON,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.tabBackgroundColor,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
