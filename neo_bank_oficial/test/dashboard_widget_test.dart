import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

import 'matches.dart';

void main() {
  testWidgets('Should display the main image when the Dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardContainer()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets('Should display the first feature when dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardContainer()));
    final firstFeature = find.byType(FeatureItem);
    expect(firstFeature, findsWidgets);
  });
  testWidgets('Check for money icon and text transfer',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardContainer()));
    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureFeatureItemMatcher(
            widget, 'Transfer', Icons.monetization_on_outlined));
    expect(transferFeatureItem, findsOneWidget);
  });
  testWidgets('Check for money icon and text transaction feed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardContainer()));
    final transactionFeedFeatureItem = find.byWidgetPredicate((widget) =>
        featureFeatureItemMatcher(
            widget, 'Transaction Feed', Icons.description_outlined));
    expect(transactionFeedFeatureItem, findsOneWidget);
  });
}
