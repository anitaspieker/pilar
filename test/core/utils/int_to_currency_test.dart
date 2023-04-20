import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/core/utils/int_to_currency.dart';

void main() {
  test('MoneyFormat | should format number to Brazilian currency', () {
    expect(MoneyFormat.moneyFormat(0), 'R\$ 0');
    expect(MoneyFormat.moneyFormat(1), 'R\$ 1');
    expect(MoneyFormat.moneyFormat(1234), 'R\$ 1.234');
    expect(MoneyFormat.moneyFormat(123456), 'R\$ 123.456');
    expect(MoneyFormat.moneyFormat(123456789), 'R\$ 123.456.789');
  });
}
