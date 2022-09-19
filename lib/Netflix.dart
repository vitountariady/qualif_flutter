import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/pages/login_page.dart';

class Netflix extends StatelessWidget {
  const Netflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginPage(),
    );
  }
}
