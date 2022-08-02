import 'package:flutter/material.dart';
import 'package:messenger/utils/app_page.dart';
import 'package:messenger/view/screens/chat_screen.dart';
import 'package:messenger/view/screens/signin_screen.dart';
import '../view/screens/registration_screen.dart';
import '../view/screens/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.welcome :(p0) => const WelcomeScreen(),
  AppRoute.signin :(p0) => const SignInScreen(),
  AppRoute.registration :(p0) => const RegestrationScreen(),
AppRoute.chat :(p0) => const ChatScreen(),



};
