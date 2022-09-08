import 'package:flutter/material.dart';
import 'package:qr_generate_extension/core/widgets/qr.dart';
import 'package:qr_generate_extension/global.dart';
import 'package:qr_generate_extension/styles/color_palatte.dart';

import 'gradient_elevated_button.dart';

class QrFormField extends StatelessWidget {
  const QrFormField({
    Key? key,
    required this.setState,
  }) : super(key: key);
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: QrFormFieldStyle.qrFormPadding,
      decoration: BoxDecoration(
        color: QrFormFieldStyle.bgColor,
        borderRadius: uiStyle.borderRadius12,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            style: QrFormFieldStyle.style,
            cursorWidth: QrFormFieldStyle.cursorWidth,
            cursorRadius: QrFormFieldStyle.cursorRadius,
            cursorColor: QrFormFieldStyle.cursorColor,
            controller: qrTextEditingController,
            maxLines: QrFormFieldStyle.formFieldMaxLines,
            minLines: QrFormFieldStyle.formFieldMinLines,
            onChanged: (data) {
              Future.microtask(() => setState(() => qrData = data));
            },
            // decoration: QrFormFieldStyle.formDecoration,
          ),
        ),
        Padding(
          padding: QrFormFieldStyle.buttonPadding,
          child: GradientElevatedButton(
            onPressed: () => Future.microtask(
                () => setState(() => qrData = qrTextEditingController.text)),
            child: const Text(
              "Generate\nQr",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              maxLines: QrFormFieldStyle.buttonMaxLines,
            ),
          ),
        ),
      ]),
    );
  }
}

class QrFormFieldStyle {
  static const int formFieldMaxLines = 3;
  static const int formFieldMinLines = 1;
  static final Color bgColor = Colors.grey.shade300;
  static const EdgeInsets qrFormPadding = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 2.5);

  static const Radius cursorRadius = Radius.circular(20);
  static const double cursorWidth = 2;
  static final TextStyle style =
      TextStyle(color: ColorPalatte.darkSlateBlue.color());
  static final Color cursorColor = ColorPalatte.seaGreen.color();
  static final ButtonStyle generateButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    fixedSize: const Size(70, 55),
  );
  static const int buttonMaxLines = 2;
}
