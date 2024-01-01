import 'package:api_master_app/models/counter_example.dart';
import 'package:test/test.dart';

void main() {
  group('Test for Counter', () {
    test('Counter should increse', () {
      final counter = Counter();
      counter.increase();
      expect(counter.value, 1);
    });

    test('Counter should decrease', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });

  group('Test for Counter', () {
    test('Counter should increse', () {
      final counter = Counter();
      counter.increase();
      counter.increase();
      expect(counter.value, 2);
    });
  });
}
