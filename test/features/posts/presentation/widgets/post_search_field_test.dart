import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/features/posts/presentation/widgets/post_search_field.dart';

void main() {
  late List<String> changes;

  Future<void> pumpField(WidgetTester tester) async {
    changes = <String>[];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: PostSearchField(onChanged: changes.add)),
      ),
    );
  }

  Finder clearButton() => find.byTooltip('Limpar busca');

  testWidgets('hides the clear button while the field is empty', (
    tester,
  ) async {
    await pumpField(tester);

    expect(clearButton(), findsNothing);
  });

  testWidgets('shows the clear button as soon as the user types', (
    tester,
  ) async {
    await pumpField(tester);

    await tester.enterText(find.byType(TextField), 'flu');
    await tester.pump();

    expect(clearButton(), findsOneWidget);
    expect(changes, ['flu']);
  });

  testWidgets('clearing empties the field, notifies and hides the button', (
    tester,
  ) async {
    await pumpField(tester);
    await tester.enterText(find.byType(TextField), 'flu');
    await tester.pump();

    await tester.tap(clearButton());
    await tester.pump();

    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, '');
    expect(changes, ['flu', '']);
    expect(clearButton(), findsNothing);
  });
}
