import 'package:flutter/material.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomColorPicker extends StatelessWidget {
  final Color currentColor;
  final Function changeColor;

  CustomColorPicker(this.currentColor, this.changeColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: RaisedButton(
        shape: CircleBorder(),
        color: currentColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  titlePadding: const EdgeInsets.all(0.0),
                  contentPadding: const EdgeInsets.all(0.0),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: currentColor,
                      onColorChanged: changeColor,
                      colorPickerWidth: 300.0,
                      pickerAreaHeightPercent: 0.7,
                      enableAlpha: false,
                      displayThumbColor: true,
                      showLabel: true,
                      paletteType: PaletteType.hsv,
                      pickerAreaBorderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
