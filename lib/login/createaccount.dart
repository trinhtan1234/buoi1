import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.lightBlue])),
        padding: EdgeInsets.only(top: 110),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(Icons.language, size: 30),
                    Text(
                      'Newforce',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(('Use the form below to access your account.')),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: TextFormField(
                    // obscureText: false,
                    style: TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      hintText: 'Enter your email here..',
                      suffixIcon: Icon(Icons.mail_outline),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Color(0x0000000),
                      //     width: 2,
                      //   ),
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      hintText: 'Enter your password here ...',
                      suffixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide:
                      //       BorderSide(color: Color(0x0000000), width: 2),
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      hintText: 'Cofirm password here ...',
                      suffixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide:
                      //       BorderSide(color: Color(0x0000000), width: 2),
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40, right: 40)),
              Container(
                width: 230,
                height: 50,
                color: Colors.blue,
                child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {},
                  child: Text('Create account'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Text(
                  'Use a social platform to continue',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/google.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Container(
                      child: Image.asset(
                        'assets/images/apple.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?     "),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
