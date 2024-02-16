import 'package:flutter/material.dart';
import 'package:survey/app/utils/constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: cCreamColor,
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
