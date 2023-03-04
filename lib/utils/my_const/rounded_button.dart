import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  Color foregroundColor;
  VoidCallback onPress;

  RoundedButton({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
