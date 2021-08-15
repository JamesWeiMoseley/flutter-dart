import 'package:proj_2/proj_2.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}

calculate() {
  print('Calculating');
}
