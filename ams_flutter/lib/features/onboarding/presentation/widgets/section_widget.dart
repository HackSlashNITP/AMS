import "package:flutter/material.dart";

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF151517),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "B.Tech(Mechanical Engg.)",
                    style: TextStyle(
                        color: Color(0xFFD2D2D2),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 13),
                  ),
                  Text(
                    "2022-2026",
                    style: TextStyle(
                        color: Color(0xFFD2D2D2),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2F2F2F),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        height: 25,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Row(
                            children: [
                              Icon(Icons.person_2_outlined,
                                  color: Color(0xFF098B06)),
                              Text(
                                "Total Strength",
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
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF098B06),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text('96',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF0FAD0C),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                height: 60,
                width: 60,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
