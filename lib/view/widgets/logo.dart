import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          child: Image.asset("assets/images/logo.png"),
        ),
        const Text(
          'Message Me',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Color(0xff2e386b),
          ),
        )
      ],
    );
  }
}
