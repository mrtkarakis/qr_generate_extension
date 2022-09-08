extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String with0() => length == 1 ? "0$this" : this;
}
