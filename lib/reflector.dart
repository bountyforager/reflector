import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Reflector extends StatefulWidget {
  const Reflector({Key key}) : super(key: key);

  @override
  _ReflectorState createState() => _ReflectorState();
}

class _ReflectorState extends State<Reflector> {
  bool _isActive = false;
  final textInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('bountyforager');

    // Start listening to changes.
    textInput.addListener(_clearReflection);
  }

  @override
  void dispose() {
    textInput.dispose();
    super.dispose();
  }

  void _clearReflection() {
    _isActive = false;
  }

  Widget reflectedText() {
    return _isActive == true
        ? Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Color(0xFF625353),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text('here\'s your text',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
                  Expanded(
                      flex: 2,
                      child: Wrap(children: [
                        Text(textInput.text,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ])),
                ],
              ),
            ))
        : Text('');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFBAFDFD),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenSize.height),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('images/reflector_png.png'),
                          height: 50,
                          width: 180,
                        ),
                        SizedBox(height: 20),
                        InputTextField(controller: textInput),
                        NewButton(onTap: () {
                          textInput.text.isEmpty
                              ? Fluttertoast.showToast(
                                  msg: 'No text',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                )
                              : setState(() {
                                  _isActive = true;
                                });
                          print('bountyforager');
                        }),
                        SizedBox(height: 30),
                        reflectedText(),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/zuri_png.png'),
            height: 40,
            width: 80,
          ),
          Image(
            image: AssetImage('images/I4G_png.png'),
            height: 40,
            width: 80,
          ),
          Image(
            image: AssetImage('images/hng_png.png'),
            height: 40,
            width: 100,
          )
        ]),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField({this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Input desired text',
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFBDBDBD)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.all(5.0),
          fillColor: const Color(0xFFF6F6F6),
          filled: true,
        ),
      ),
    );
  }
}

class NewButton extends StatelessWidget {
  NewButton({this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFF625353)),
        child: Center(
          child: Text(
            'Submit',
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
