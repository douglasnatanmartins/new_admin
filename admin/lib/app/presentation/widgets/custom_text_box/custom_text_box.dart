import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox(
      {super.key,
      this.onChanged,
      this.inputFormatters,
      required this.label,
      required this.placeholder,
      this.isLogin = false,
      this.obscureText = false,
      this.error = false,
      this.padding = const EdgeInsets.only(top: 30, left: 0, right: 0),
      this.readOnly = false, this.onEditingComplete});

  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final String placeholder;
  final bool? isLogin;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final bool? error;
  final bool? readOnly;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: InfoLabel(
          label: '$label:',
          labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          child: TextBox(
            onEditingComplete: onEditingComplete,
            readOnly: readOnly!,
            decoration: BoxDecoration(
              border: Border.all(color: error! ?Colors.grey[80] : Colors.red)
            ),
            unfocusedColor:Colors.grey[80],
            placeholder: placeholder,
            expands: false,
            style: TextStyle(
                fontWeight: isLogin! ? FontWeight.w500 : null, fontSize: 16),
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            obscuringCharacter: '*',
          ),
        ));
  }
}
