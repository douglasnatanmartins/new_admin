// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final UserManager userManager = GetIt.I<UserManager>();

  Future<Timer> startTime() async {
    return Timer(const Duration(seconds: 3), validationCallbacks);
  }

  Future<void> validationCallbacks() async {
    await userManager.getCurrentUser(context);
    if(!userManager.isLoggedIn){
      Navigator.of(context).pushNamed('/login');
      

    } else {
      Navigator.of(context).pushNamed('/base');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('CARREGANDO...!!!', style: GoogleFonts.aBeeZee(),),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator()
        ],
      )),
    );
  }
}
