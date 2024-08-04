import "dart:math";
import "package:flutter/material.dart";

class AnimatedTextWithArrow extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  const AnimatedTextWithArrow({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  _AnimatedTextWithArrowState createState() => _AnimatedTextWithArrowState();
}

class _AnimatedTextWithArrowState extends State<AnimatedTextWithArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: widget.textStyle ?? TextStyle(fontSize: 16),
        ),
        SizedBox(width: 8), // Add some space between text and icon
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 4 * sin(_controller.value * 2 * 3.14159)),
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
