import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';

class CallToActionTableDesktop extends StatefulWidget {
  const CallToActionTableDesktop(this.title, {super.key});
  final String title;

  @override
  _CallToActionTableDesktopState createState() =>
      _CallToActionTableDesktopState();
}

class _CallToActionTableDesktopState extends State<CallToActionTableDesktop> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        decoration: BoxDecoration(
          color: _isHovered ? primaryColor : Colors.black,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.black54 : Colors.black45,
              offset: _isHovered ? const Offset(5, 5) : const Offset(3, 3),
              blurRadius: _isHovered ? 10 : 6,
              spreadRadius: _isHovered ? 2 : 0,
            )
          ],
        ),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -5, 0))
            : Matrix4.identity(),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: _isHovered ? 20 : 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
