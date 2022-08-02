import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger/utils/app_page.dart';

import '../widgets/auth_buttom.dart';
import '../widgets/logo.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Logo(),
            SizedBox(height: size.height * 0.03),
            Auth_Buttom(
              color: Colors.yellow[900]!,
              title: 'Sign In',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.signin);
              },
            ),
            Auth_Buttom(
              color: Colors.blue[900]!,
              title: 'Register ',
              onPressed: () {
                 Navigator.of(context).pushNamed(AppRoute.registration);
              },
            ),
          ],
        ),
      ),
    );
  }
}
