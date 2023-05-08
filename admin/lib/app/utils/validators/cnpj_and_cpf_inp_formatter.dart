import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CNPJAndCPFInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var value = _prepareValue(newValue);
    if (value.isNotEmpty && value.length <= 11) {
      value = _appendMask(value, '###.###.###-##');
    } else if (value.isNotEmpty && value.length <= 14) {
      value = _appendMask(value, '##.###.###/####-##');
    } else if (value.length > 14) {
      return oldValue;
    }

    return newValue.copyWith(
      text: value,
      selection: TextSelection.fromPosition(
        TextPosition(offset: value.length),
      ),
    );
  }
  String _prepareValue(TextEditingValue newValue) {
    var value = newValue.text;
    value = value.replaceAll(RegExp(r'[^\d]'), '');
    return value;
  }

  String _appendMask(String value, String mask) {
    for (var i = 0; i < value.length; i++) {
      mask = mask.replaceFirst('#', value[i]);
    }
    var lastHash = mask.indexOf('#');

    if (lastHash != -1) {
      mask = mask.characters.getRange(0, lastHash).join();
      if (RegExp(r'[^\d]').hasMatch(mask.characters.last)) {
        mask = mask.characters.getRange(0, mask.length - 1).join();
      }
    }

    return mask;
  }
}