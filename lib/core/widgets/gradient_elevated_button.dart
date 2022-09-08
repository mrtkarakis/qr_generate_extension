import 'package:flutter/material.dart';
import 'package:qr_generate_extension/styles/color_palatte.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    Key? key,
    this.onPressed,
    this.child,
    this.radius = 12,
  }) : super(key: key);
  final Function()? onPressed;
  final Widget? child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(colors: [
            ColorPalatte.darkSlateGrey.color(),
            ColorPalatte.seaGreen.color(),
          ])),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: child,
      ),
    );
  }
}
