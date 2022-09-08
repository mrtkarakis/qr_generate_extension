import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_generate_extension/core/widgets/copy_text_widgt.dart';
import 'package:qr_generate_extension/core/widgets/qr.dart';
import 'package:qr_generate_extension/core/widgets/qr_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 300,
          width: 220,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Qr(setState: setState),
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      CopyTextWidget(setState: setState),
                      const SizedBox(height: 10),
                      CopyTextWidget(setState: setState),
                      const SizedBox(height: 5),
                    ],
                  )
                ],
              ),
              const Spacer(),
              QrFormField(setState: setState),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
