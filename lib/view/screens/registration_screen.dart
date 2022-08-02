import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger/utils/app_page.dart';
import 'package:messenger/view/widgets/auth_buttom.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/text_filed_auth.dart';

class RegestrationScreen extends StatefulWidget {
  const RegestrationScreen({Key? key}) : super(key: key);

  @override
  State<RegestrationScreen> createState() => _RegestrationScreenState();
}

class _RegestrationScreenState extends State<RegestrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: size.height * 0.06),
              TextFiledAuth(
                obscureText: false,
                onChanged: (val) {
                  email = val;
                },
                title: 'Enter your Email',
              ),
              SizedBox(height: size.height * 0.02),
              TextFiledAuth(
                obscureText: true,
                onChanged: (val) {
                  password = val;
                },
                title: 'Enter your Password',
              ),
              SizedBox(height: size.height * 0.03),
              Auth_Buttom(
                color: Colors.blue[800]!,
                title: 'Register',
                onPressed: () async {
                  // print(email);
                  // print(password );
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, AppRoute.chat);
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
