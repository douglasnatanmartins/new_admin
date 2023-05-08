extension StringExtension on String {
  bool isPasswordValid() {
    final RegExp regex = RegExp(
        r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?:([0-9a-zA-Z$*&@#])(?!\1)){8,}$");

    return regex.hasMatch(this);
  }
}

/*
^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}$/

  (?=.*\d)               // deve conter ao menos um dígito
  (?=.*[a-z])           // deve conter ao menos uma letra minúscula
  (?=.*[A-Z])           // deve conter ao menos uma letra maiúscula
  (?=.*[$*&@#])         // deve conter ao menos um caractere especial - Retirado da RegExp
  [0-9a-zA-Z$*&@#]{8,}  // deve conter ao menos 8 dos caracteres mencionados

*/