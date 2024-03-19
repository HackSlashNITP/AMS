import "package:ams_flutter/core/constants/app_icons.dart";
import "package:ams_flutter/core/constants/app_string.dart";
import "package:ams_flutter/core/constants/app_text_styles.dart";
import "package:flutter/material.dart";

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            AppIcons.app_icon,
            width: 48,
            height: 48,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 130, left: 27, right: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(CONTENT_HEADER,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontFamily.poppins)),
                Padding(
                  padding: EdgeInsets.only(left: 6, right: 6, top: 51),
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFFB3B3B3),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          labelText: PASSWORD_TEXT_FIELD,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB3B3B3)),
                              borderRadius: BorderRadius.circular(8)),
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB3B3B3),
                              fontFamily: AppFontFamily.poppins)),
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6, right: 6, top: 22),
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFFB3B3B3),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          labelText: CONFIRM_PASSWORD_TEXT_FIELD,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB3B3B3)),
                              borderRadius: BorderRadius.circular(8)),
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB3B3B3),
                              fontFamily: AppFontFamily.poppins)),
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 22),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF4E9F3D),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(SUBMIT_BUTTON,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: AppFontFamily.poppins)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
