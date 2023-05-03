import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

class CustomButtonEdit extends StatelessWidget {
  const CustomButtonEdit(
      {super.key,
      this.onPressed,
      this.padding = const EdgeInsets.only(top: 5, bottom: 5),
      this.margin = const EdgeInsets.only(top: 3, bottom: 3)});

  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return m.Material(
      color: Colors.transparent,
      child: m.InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: m.Container(
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: m.Colors.blue.shade600),
            child: m.Icon(
              m.Icons.edit,
              color: Colors.grey[10],
            ),
          ),
        ),
      ),
    );
  }
}
