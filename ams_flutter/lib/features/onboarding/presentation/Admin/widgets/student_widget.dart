import "package:flutter/material.dart";
import "package:getwidget/colors/gf_color.dart";
import "package:getwidget/components/progress_bar/gf_progress_bar.dart";

class StudentWidget extends StatelessWidget {
  const StudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double percentage = 0.9;
    return Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF999999),
            width: 0.4,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PIYUSH SINGH",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Roll-2204070",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2F2F2F),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    height: 30,
                    width: 210,
                    child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Row(
                          children: [
                            Icon(Icons.book_outlined, color: Color(0xFF098B06)),
                            Text(
                              "Department",
                              style: TextStyle(
                                  color: Color(0xFFF4F4F4),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontSize: 11),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Container(
                                width: 100,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFF098B06),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Center(
                                  child: Text('Electronics',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            )
                          ],
                        )))
              ]),
              SizedBox(height: 10),
              Text("Attendance",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 10),
              GFProgressBar(
                percentage: percentage,
                backgroundColor: Colors.black26,
                animation: true,
                linearGradient: LinearGradient(
                  colors: [
                    Color(0xFFDD20ED),
                    Color(0xFF0D9EBE),
                  ],
                ),
              )
            ])));
  }
}
