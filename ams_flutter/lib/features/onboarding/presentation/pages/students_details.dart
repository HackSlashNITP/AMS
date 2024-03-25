import "package:ams_flutter/features/onboarding/presentation/widgets/bottom_navbar.dart";
import "package:ams_flutter/features/onboarding/presentation/widgets/student_widget.dart";
import "package:flutter/material.dart";

const List<String> list1 = <String>['B.Tech', 'M.Tech', 'PhD'];
const List<String> list2 = <String>['B.Tech', 'M.Tech', 'PhD'];

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({super.key});

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF098B06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SearchBar(
                    controller: controller,
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 2.5),
                    hintText: "Search class",
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    surfaceTintColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
            ),
            StudentWidget()
          ],
        ),
      )),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
