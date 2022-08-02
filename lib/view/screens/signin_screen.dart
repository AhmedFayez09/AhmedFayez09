import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/utils/app_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/auth_buttom.dart';
import '../widgets/text_filed_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
bool showSpinner = false ;
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
                color: Colors.yellow[800]!,
                title: 'Sign In',
                onPressed: ()async {
                  setState(() {
                    showSpinner = true;
                  });
                 try {
                    final user =await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if(user != null){
                    Navigator.of(context).pushNamed(AppRoute.chat);
                    setState(() {
                      showSpinner = false;
                    });
                  }
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
