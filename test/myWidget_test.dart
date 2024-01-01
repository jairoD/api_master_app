import 'package:api_master_app/layouts/test_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Testing widget example", (tester) async {
    await tester.pumpWidget(WidgetTest(title: 'example'));
    final titleToFind = find.text('example');
    expect(titleToFind, findsWidgets);
  });
}
