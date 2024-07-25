import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}
