class Formatters {
  const Formatters._();

  static String currency(num value, {String symbol = '\$'}) {
    return '$symbol${value.toStringAsFixed(2)}';
  }

  static String maskAccount(String value) {
    if (value.length <= 4) {
      return value;
    }

    return '${value.substring(0, 2)}****${value.substring(value.length - 2)}';
  }
}
