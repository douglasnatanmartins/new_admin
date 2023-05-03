import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart' as m;
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormBox extends StatelessWidget {
  const CustomTextFormBox(
      {super.key,
      required this.title,
      this.constainsInfo = false,
      this.validator,
      this.onTap,
      this.initialValue,
      this.enabled,
      this.maxLines,
      this.maxLength,
      this.inputFormatters,
      this.onChanged,
      this.focusNode,
      this.errorText,
      this.width = 200,
      this.children = 1});

  final String title;
  final bool constainsInfo;
  final Function()? onTap;
  final int children;
  final double width;
  final int? maxLines;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? enabled;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        constainsInfo
            ? SizedBox(
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        title,
                        style: GoogleFonts.roboto(
                            fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: m.Material(
                        color: Colors.transparent,
                        child: m.InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: onTap,
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            child: const Icon(
                              FontAwesomeIcons.solidCircleQuestion,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title,
                  style:
                      GoogleFonts.roboto(fontSize: 14, color: Colors.grey[170]),
                ),
              ),
        Row(children: [
          SizedBox(
              width: width,
              child: TextFormBox(
                maxLines: maxLines,
                focusNode: focusNode,
                initialValue: initialValue,
                enabled: enabled,
                placeholder: title,
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[180],
                    fontWeight: FontWeight.w700),
                placeholderStyle: GoogleFonts.roboto(color: Colors.grey[120]),
                validator: validator,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[200]
                  ),
                  boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100], spreadRadius: 1, blurRadius: 30),
                ]),
              )),
        ])
      ],
    );
  }
}
