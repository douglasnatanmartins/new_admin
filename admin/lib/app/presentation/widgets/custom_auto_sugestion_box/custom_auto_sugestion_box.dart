import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAutoSugestionBox extends StatelessWidget {
  const CustomAutoSugestionBox(
      {super.key,
      this.width = 200,
      required this.list,
      required this.placeholder,
      this.onSelected,
      this.inputFormatters,
      this.validator});

  final double? width;
  final List<AutoSuggestBoxItem<Object>> list;
  final String placeholder;
  final Function(AutoSuggestBoxItem<Object>)? onSelected;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 2),
          Text(
            placeholder,
            style: GoogleFonts.roboto(),
          ),
          const SizedBox(height: 7.6),
          AutoSuggestBox<Object>.form(
            items: list,
            placeholder: placeholder,
            style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[180],
                fontWeight: FontWeight.w700),
            placeholderStyle: GoogleFonts.roboto(color: Colors.grey[120]),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100], spreadRadius: 1, blurRadius: 30),
                ]),
            onSelected: onSelected,
            inputFormatters: inputFormatters,
            validator: validator,
          ),
          const SizedBox(height: 0.5),
        ],
      ),
    );
  }
}
