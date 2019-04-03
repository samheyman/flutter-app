// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mama_fit_club/main.dart';

void main() {
  testWidgets('Test home page displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MamaFitClub());
    final titleFinder = find.text('Trimester 1');
    final subtitleFinder = find.text('13 weeks, 1 day');
    // final exerciseTipFinder = find.text('exercise tip');
    // final nutritionTipFinder = find.text('Nutrition tip');

    // Verify that our counter starts at 0.
    // expect(find.text(''), findsWidgets);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
    // expect(exerciseTipFinder, findsOneWidget);
    // expect(nutritionTipFinder, findsOneWidget);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.text('Classes'));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('60min'), findsWidgets);
  });
}
