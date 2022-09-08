extension StringExtenIntegerExtensionsion on int {
  String valueWithLetters() {
    late String result;
    int divide = "$this".length ~/ 3;
    int mod = "$this".length % 3;
    if (mod == 0) {
      divide = divide - 1;
      mod = 3;
    }

    switch (divide) {
      case 1:
        result = "${'$this'.substring(0, mod)}K";
        break;
      case 2:
        result = "${'$this'.substring(0, mod)}M";
        break;
      case 3:
        result = "${'$this'.substring(0, mod)}B";
        break;
      case 4:
        result = "${'$this'.substring(0, mod)}T";
        break;
      case 5:
        result = "${'$this'.substring(0, mod)}Q";
        break;
      default:
        result = toString();
    }
    return result;
  }
}
