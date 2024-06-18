import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, allow clearing the field
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final StringBuffer newText = StringBuffer();
    final cleanValue = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Apply #### ### ## ## format
    for (int i = 0; i < cleanValue.length; i++) {
      //parantezleme yaparak 4, 7 ve 9. karakterlerin arasına boş55luk ekliyoruz

      if (i == 0) {
        newText.write('(');
      }
      if (i == 3) {
        newText.write(')');
      }

      if (i == 3 || i == 6) {
        newText.write(' ${cleanValue[i]}');
      } else {
        newText.write(cleanValue[i]);
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, allow clearing the field
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final StringBuffer newText = StringBuffer();
    final cleanValue = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Apply #### #### #### #### format
    for (int i = 0; i < cleanValue.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newText.write(' ');
      }
      newText.write(cleanValue[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
