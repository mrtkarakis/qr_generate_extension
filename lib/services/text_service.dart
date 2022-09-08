import 'package:flutter/services.dart';

class TextService {
  Future<String?> getCopyText() async {
    String? result;
    // bool hasCopyText = await Clipboard.hasStrings();
    // print("aynen  hasCopyText $hasCopyText");
    // if (hasCopyText) {
    ClipboardData? copyText = await Clipboard.getData('text/plain');
    result = copyText?.text?.trim();
    // }
    return result;
  }

  void copyText(String data) {
    if (data.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: data));
    }
  }
}
