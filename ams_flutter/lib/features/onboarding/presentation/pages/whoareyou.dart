import 'package:ams_flutter/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  @override
  Widget build(BuildContext context) {
    final double baseWidth = 430;
    final double fem = MediaQuery.of(context).size.width / baseWidth;
    final double ffem = fem * 0.97;

    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(45 * fem, 21 * fem, 63 * fem, 216 * fem), // Adjusted bottom padding
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18 * fem, 0, 0, 18 * fem),
              width: 48 * fem,
              height: 48 * fem,
              child: Image.asset(
                AppImages.splash_image,
                width: 48 * fem,
                height: 48 * fem,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30 * fem, 0, 38 * fem),
              child: Text(
                'Who Are You?',
                style: GoogleFonts.poppins(
                  fontSize: 32 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff151517),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18 * fem, 0, 0, 39 * fem),
              width: 298 * fem,
              height: 202 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 52 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 298 * fem,
                        height: 150 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(0, -1),
                              end: Alignment(0, 1),
                              colors: <Color>[
                                Color(0xff4e9f3d),
                                Color(0xff2c671f),
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18 * fem,
                    top: 92 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 138 * fem,
                        height: 59 * fem,
                        child: Text(
                          'I’m\nProfessor',
                          style: GoogleFonts.poppins(
                            fontSize: 26.06 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1 * ffem / fem,
                            color: Color(0xffffffff),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 168 * fem,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 130 * fem,
                        height: 202 * fem,
                        child: Image.asset(
                          AppImages.teacher_image,
                          width: 130 * fem,
                          height: 202 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(21 * fem, 10 * fem, 0, 0),
              width: 301 * fem,
              height: 236 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 35 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 298 * fem,
                        height: 150 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9 * fem),
                            gradient: LinearGradient(
                              begin: Alignment(0, -1),
                              end: Alignment(0, 1),
                              colors: <Color>[
                                Color(0xfff7c645),
                                Color(0xffb18b29),
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18 * fem,
                    top: 92 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 138 * fem,
                        height: 59 * fem,
                        child: Text(
                          'I’m\nStudent',
                          style: GoogleFonts.poppins(
                            fontSize: 26.06 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1 * ffem / fem,
                            color: Color(0xffffffff),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 149 * fem,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 152 * fem,
                        height: 185 * fem,
                        child: Image.asset(
                          AppImages.student_image,
                          width: 152 * fem,
                          height: 185 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
