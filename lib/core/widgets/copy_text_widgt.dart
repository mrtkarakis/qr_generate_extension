import 'package:flutter/material.dart';
import 'package:qr_generate_extension/core/widgets/qr.dart';
import 'package:qr_generate_extension/global.dart';

import 'gradient_elevated_button.dart';

class CopyTextWidget extends StatelessWidget {
  const CopyTextWidget({Key? key, required this.setState}) : super(key: key);
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return GradientElevatedButton(
      onPressed: () async => qrData = await textService.getCopyText() ?? "",
      child: const Text(
        "Use Copied\nText",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
    );
  }
}
