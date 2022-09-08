import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_generate_extension/core/widgets/qr.dart';
import 'package:qr_generate_extension/global.dart';
import 'package:qr_generate_extension/styles/color_palatte.dart';

import 'gradient_elevated_button.dart';

class ChangeColor extends StatelessWidget {
  const ChangeColor(
      {Key? key, required this.setState, this.isForegroundColor = true})
      : super(key: key);
  final Function setState;
  final bool isForegroundColor;
  static List<ColorPalatte> colorList = ColorPalatte.values.toList();

  @override
  Widget build(BuildContext context) {
    final String name =
        isForegroundColor ? "Foreground Color" : "Background Color";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(child: Text(name)),
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
                    final Color color = colorList[index].color();
                    final bool isSelect = isForegroundColor
                        ? (qrService.foregroundColor == color)
                        : (qrService.backgroundColor == color);
                    return InkWell(
                      borderRadius: BorderRadius.circular(99),
                      onTap: () {
                        Future.microtask(() => setState(() {
                              if (isForegroundColor &&
                                  color != qrService.backgroundColor) {
                                qrService.foregroundColor = color;
                              } else if (!isForegroundColor &&
                                  color != qrService.foregroundColor) {
                                qrService.backgroundColor = color;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 220,
                                          width: 165,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/color_palette.png",
                                                  height: 50,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "two colors cannot\nbe the same",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700),
                                                  ),
                                                ),
                                                GradientElevatedButton(
                                                    horizontalPadding: 30,
                                                    child: const Text(
                                                      "Okay",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pop(context)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                        alignment: Alignment.topLeft,
                        child: isSelect
                            ? Image.asset(
                                "assets/icons/selected.png",
                                height: 12,
                              )
                            : const SizedBox(),
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

// enum ChangeColorType {
//   foregroundColor("Foreground Color"),
//   backgroundColor("Background Color");

//   final String name;
//   const ChangeColorType(this.name);
// }
