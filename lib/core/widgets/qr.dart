import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate_extension/global.dart';

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
      tag: qrService.qrData,
      key: Key(qrService.qrData),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: QrImage(
          key: Key(qrService.qrData),
          data: qrService.qrData,
          version: QrVersions.auto,
          size: qrImageSize,
          backgroundColor: qrService.backgroundColor,
          foregroundColor: qrService.foregroundColor,
          constrainErrorBounds: false,
          embeddedImageEmitsError: false,
          errorCorrectionLevel: 1,
        ),
      ),
    );
  }
}
