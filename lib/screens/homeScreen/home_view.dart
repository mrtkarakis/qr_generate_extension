import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_generate_extension/core/widgets/copy_text_widgt.dart';
import 'package:qr_generate_extension/core/widgets/gradient_elevated_button.dart';
import 'package:qr_generate_extension/core/widgets/qr.dart';
import 'package:qr_generate_extension/core/widgets/qr_form_widget.dart';
import 'package:qr_generate_extension/services/image_services.dart';
import 'package:qr_generate_extension/styles/color_palatte.dart';

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
          height: 330,
          width: 220,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(.4),
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
              const Spacer(flex: 2),
              QrFormField(setState: setState),
              const Spacer(),
              SizedBox(height: 50, child: changeColor()),
              const Spacer(flex: 2),
              SizedBox(height: 50, child: changeColor()),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Column changeColor() {
    List<ColorPalatte> colorList = ColorPalatte.values.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FittedBox(child: Text("Forceground Color")),
        const SizedBox(height: 4),
        SizedBox(
          height: 30,
          child: Row(
            children: [
              SizedBox(
                width: 155,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: colorList.length,
                  separatorBuilder: ((context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                      )),
                  itemBuilder: (BuildContext context, index) {
                    Color color = colorList[index].color();
                    return InkWell(
                      borderRadius: BorderRadius.circular(99),
                      onTap: () {
                        Future.microtask(
                            () => setState(() => foregroundColor = color));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              GradientElevatedButton(
                height: 30,
                width: 30,
                radius: 99,
                horizontalPadding: 0,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    "assets/icons/right_arrow.png",
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
