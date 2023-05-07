class ConvertCodes {

  static String convertCodeProduct(String codigo){
    final code = int.parse(codigo);

    if(code < 10){
      return 'PR00000$code';
    } else if (code < 100){
      return 'PR0000$code';
    } else if (code < 1000){
      return 'PR000$code';
    } else if (code < 10000){
      return 'PR00$code';
    } else if (code < 100000){
      return 'PR0$code';
    } else if (code < 1000000){
      return 'PR$code';
    } else {
      return code.toString();
    }
  }
}