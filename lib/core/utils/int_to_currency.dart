class MoneyFormat {
  static String moneyFormat(int number) {
    if (number.toString().length > 2) {
      var string = number.toString();
      string = string.replaceAll(RegExp(r'\D'), '');
      string = string.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return "R\$ $string";
    }
    return "R\$ 0";
  }
}
