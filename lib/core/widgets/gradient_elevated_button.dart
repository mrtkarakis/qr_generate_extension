import 'package:flutter/material.dart';
import 'package:qr_generate_extension/styles/color_palatte.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    Key? key,
    this.onPressed,
    this.child,
    this.radius = 12,
    this.horizontalPadding = 10,
    this.height = 50,
    this.width,
  }) : super(key: key);
  final Function()? onPressed;
  final Widget? child;
  final double height;
  final double? width;
  final double radius;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: child,
      ),
    );
  }
}
