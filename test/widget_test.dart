import 'package:flutter_test/flutter_test.dart';
import 'package:moonlite/main.dart';

void main() {
  testWidgets('Moonlite app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MoonliteApp());
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('MOONLITE'), findsWidgets);
  });
}
