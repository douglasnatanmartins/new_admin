import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      this.constainsInfo = false,
      this.validator,
      this.onTap,
      this.initialValue,
      this.enabled,
      required this.hint,
      this.maxLines,
      this.maxLength,
      this.inputFormatters,
      this.onChanged,
      this.focusNode,
      this.errorText,
      this.width = 200,
      this.children = 1});

  final String title;
  final String hint;
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
                            fontSize: 14, color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
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
                  style: GoogleFonts.roboto(
                      fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
        Row(
          children: [
            SizedBox(
              width: width,
              child: TextFormField(
                focusNode: focusNode,
                maxLength: maxLength,
                enabled: enabled,
                initialValue: initialValue,
                maxLines: maxLines,
                decoration: InputDecoration(

                    counterText: '',
                    isDense: true,
                    hintText: hint,
                    errorText: errorText,
                    hintStyle: GoogleFonts.roboto(
                        fontSize: 14, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500),
                validator: validator,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
              ),
            ),
          ],
        )
      ],
    );
  }
}
