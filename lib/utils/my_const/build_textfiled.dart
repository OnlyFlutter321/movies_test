import 'dart:ffi';

import 'package:flutter/material.dart';

class buildTextfiled extends StatelessWidget {
  String label;
  Icon? pr;
  Color color;
  Color backgroundColor;
  double left;
  double right;

  TextInputType? keybooardType;
  // TextEditingController buildTextEditingController,
  TextEditingController tx;
  buildTextfiled({
    required this.label,
    this.pr,
    required this.color,
    required this.backgroundColor,
    required this.tx,
    this.left = 15.0,
    this.right = 15.0,
    this.keybooardType,

    // required this.buildTextEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: TextFormField(
            controller: tx,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              border: InputBorder.none,
              labelText: label,
              suffixIcon: pr,
              labelStyle: TextStyle(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
