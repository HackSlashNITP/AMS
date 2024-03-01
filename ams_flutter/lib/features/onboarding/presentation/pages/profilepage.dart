import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/constants/images.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/utils.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      // width: double.infinity,
      body: Container(
        // markattendancef6f (140:250)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(33*fem, 27*fem, 27*fem, 33*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupgcqvsCj (7MqZUSosS39F2eDUNBGCQV)
                    margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 47*fem),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // arrow2Pgs (140:269)
                          // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                          width: 25*fem,
                          height: 25*fem,
                          child: Image.asset(
                            AppImages.arrow_image,
                            width: 25*fem,
                            height: 25*fem,
                          ),
                        ),
                        Container(
                          // yourprofileVju (141:492)
                          // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 190*fem, 0*fem),
                          child: Text(
                            'Your profile',
                            style: GoogleFonts.poppins (
                              fontSize: 18.06*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color: Color(0xff098b06),
                            ),
                                //  style:AppTextStyles.profilepagestyle1,
                          ),
                        ),
                        Container(
                          // bell1PqH (140:265)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                          width: 25*fem,
                          height: 25*fem,
                          child: Image.asset(
                            AppImages.bell_image,
                            width: 25*fem,
                            height: 25*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupeucuhb5 (7MqZfmpL2Sp5inmqvBEUcu)
                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 2*fem, 22*fem),
                    padding: EdgeInsets.fromLTRB(24*fem, 16*fem, 24.24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xff9b9b9b)),
                      color: Color(0xfff8faf9),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupdbndNx7 (7MqZpGaAyFZiEuC85gDBnD)
                          margin: EdgeInsets.fromLTRB(113*fem, 0*fem, 113.76*fem, 24*fem),
                          padding: EdgeInsets.fromLTRB(6*fem, 6*fem, 6*fem, 6*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffe8e8e8),
                            borderRadius: BorderRadius.circular(43*fem),
                          ),
                          child: Center(
                            // ellipse12GXh (141:494)
                            child: SizedBox(
                              width: double.infinity,
                              height: 74*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(37*fem),
                                  border: Border.all(color: Color(0xffb4b4b4)),
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      AppImages.dp_image,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // group80wtj (151:519)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20.51*fem),
                          width: double.infinity,
                          height: 127.49*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // group79Gg7 (151:518)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // nameQ1d (151:505)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        'Name',
                                      style:AppTextStyles.profilepagestyle1,
                                      ),
                                    ),
                                    Container(
                                      // idhmR (151:506)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        'ID',
                                    style:AppTextStyles.profilepagestyle1,
                                      ),
                                    ),
                                    Container(
                                      // email1GK (151:507)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        'Email',
                                      style:AppTextStyles.profilepagestyle1,
                                      ),
                                    ),
                                    Container(
                                      // contacthuq (151:508)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        'Contact',
                                        style:AppTextStyles.profilepagestyle1,
                                      ),
                                    ),
                                    Container(
                                      // designationd2o (151:509)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        'Designation',
                                      style:AppTextStyles.profilepagestyle1,
                                      ),
                                    ),
                                    Text(
                                      // socialmediawJP (151:510)
                                      'Social Media',
                                     style:AppTextStyles.profilepagestyle1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group78gFy (151:517)
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // stevec9d (151:511)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.81*fem, 3.9*fem),
                                      child: Text(
                                        'Steve',
                                        textAlign: TextAlign.right,
                                        style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                    Container(
                                      // K43 (151:512)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.01*fem, 3.9*fem),
                                      child: Text(
                                        '12342143',
                                        textAlign: TextAlign.right,
                                      style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                    Container(
                                      // nitnitacinEB1 (151:513)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.47*fem, 3.9*fem),
                                      child: Text(
                                        'nit@nit.ac.in',
                                        textAlign: TextAlign.right,
                                     style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                    Container(
                                      // xxxxxxxvpX (151:514)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.9*fem),
                                      child: Text(
                                        '78XXXXXXX',
                                        textAlign: TextAlign.right,
                                     style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                    Container(
                                      // teachereEj (151:515)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.67*fem, 3.9*fem),
                                      child: Text(
                                        'Teacher',
                                        textAlign: TextAlign.right,
                                     style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                    Container(
                                      // httpswwwinstagramcomM99 (151:516)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.76*fem, 0*fem),
                                      child: Text(
                                        'https://www.instagram.com',
                                        textAlign: TextAlign.right,
                                     style:AppTextStyles.profilepagestyle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 72*fem,
                              height: 19*fem,
                              decoration: BoxDecoration (
                                color: Color(0xff065cab),
                                borderRadius: BorderRadius.circular(4*fem),
                              ),
                              child: Container(
                                // group77vbZ (151:504)
                                padding: EdgeInsets.fromLTRB(0.67*fem, 0*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      // edit1E6T (151:501)
                                      // margin: EdgeInsets.fromLTRB(0*fem, 0.96*fem, 4.63*fem, 0*fem),
                                      width: 6.71*fem,
                                      height: 6.71*fem,
                                      child: Image.asset(
                                        AppImages.edit_image,
                                        width: 6.71*fem,
                                        height: 6.71*fem,
                                      ),
                                    ),
                                    Text(
                                      // editdetails7g3 (149:500)
                                      'Edit details',
                                      style: GoogleFonts.poppins (
                                        fontSize: 8.6*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                      // style:AppTextStyles.profilepagestyle2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 2*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(23*fem, 8*fem, 23*fem, 24*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xff9b9b9b)),
                      color: Color(0xfff8faf9),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Attendance',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins (
                                    fontSize: 13.36*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff171717),
                                  ),
                                  // style:AppTextStyles.profilepagestyle2,
                                ),
                              ),
                              Container(
                                // width: 17*fem,
                                height: 17*fem,
                                
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      AppImages.ellipse1_image,
                                      width: 20*fem,
                                      height: 20*fem,
                                    ),
                                    Positioned(
                                      left: (20 * fem - 15 * fem) / 2,
                                       top: (20 * fem - 15 * fem) / 2,
                                      child: Image.asset(
                                        AppImages.rightarrow_image,
                                        width: 15*fem,
                                        height: 15*fem,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupq7hoSkF (7MqaaVoUevFCJ88sHbq7ho)
                          margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 6*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // recantmonthabZ (151:523)
                                // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 251*fem, 0*fem),
                                child: Text(
                                  'Recent Month',
                                  textAlign: TextAlign.right,
                                  // style: GoogleFonts.poppins (
                                    
                                  //   fontSize: 6.5986447334*ffem,
                                  //   fontWeight: FontWeight.w600,
                                  //   height: 1.5*ffem/fem,
                                  //   color: Color(0xff171717),
                                  // ),
                                  style:AppTextStyles.profilepagestyle2
                                ),
                              ),
                              Text(
                                // J1m (151:527)
                                '60%',
                                textAlign: TextAlign.right,
                                // style: GoogleFonts.poppins (
                                //   'Poppins',
                                //   fontSize: 6.5986447334*ffem,
                                //   fontWeight: FontWeight.w600,
                                //   height: 1.5*ffem/fem,
                                //   color: Color(0xff171717),
                                // )
                                // 
                                style:AppTextStyles.profilepagestyle2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group82qnP (151:526)
                          margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                          width: 312*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(23*fem),
                          ),
                          child: Align(
                            // rectangle38xc7 (151:525)
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 179*fem,
                              height: 9*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(23*fem),
                                  gradient: LinearGradient (
                                    begin: Alignment(1, 0.111),
                                    end: Alignment(-1, 0.111),
                                    colors: <Color>[Color(0xffdc20ed), Color(0xff0d9ebd)],
                                    stops: <double>[0, 1],
                                  ),
                                ),
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
          ],
      
        
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
          );
  }
}