import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

String qrData = "";
Color backgroundColor = Colors.black;
Color foregroundColor = Colors.white;
TextEditingController qrTextEditingController = TextEditingController();

class Qr extends StatelessWidget {
  const Qr({
    Key? key,
    required this.setState,
  }) : super(key: key);
  final Function setState;

  @override
  Widget build(BuildContext context) {
    double qrImageSize = 100;
    // final String data = qrStore.data;
    // final Object tag = data;
    // final Key qrKey = Key(data);
    // final Color backgroundColor = qrStore.backgroundColor;
    // final QrDataModuleStyle dataModuleStyle = qrStore.dataModuleStyle;
    // final QrEyeStyle eyeStyle = qrStore.eyeStyle;
    // final Color foregroundColor = qrStore.foregroundColor;
    // final bool gapless = qrStore.gapless;
    // final EdgeInsets padding = qrStore.padding;
    // const bool constrainErrorBounds = false;
    // const bool embeddedImageEmitsError = false;
    // const int errorCorrectionLevel = 1;
    return Hero(
      tag: qrData,
      key: Key(qrData),
      child: QrImage(
        key: Key(qrData),
        data: qrData,
        version: QrVersions.auto,
        size: qrImageSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        constrainErrorBounds: false,
        embeddedImageEmitsError: false,
        errorCorrectionLevel: 1,
      ),
    );
  }
}
