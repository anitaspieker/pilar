import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/core/utils/string_normalizer.dart';

void main() {
  test('StringNormalizer | should normalize accentuated characters and convert to lowercase', () {
    expect(StringNormalizer.normalizeString('ÁbcdefÉgHíjkLmnÑopqrStuvWxYz'), 'abcdefeghijklmnnopqrstuvwxyz');
    expect(StringNormalizer.normalizeString('ÇaçadorDePokémons'), 'cacadordepokemons');
    expect(StringNormalizer.normalizeString('Übermensch'), 'ubermensch');
    expect(StringNormalizer.normalizeString('é uma frase em Português'), 'e uma frase em portugues');
  });
}
