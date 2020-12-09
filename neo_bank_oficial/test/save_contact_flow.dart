import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neo_bank_oficial/main.dart';
import 'package:neo_bank_oficial/screens/contact_form.dart';
import 'package:neo_bank_oficial/screens/contacts_list.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

import 'matches.dart';
import 'mocks.dart';

void main() {
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(NeoBankApp(
      contactDao: mockContactDao,
    ));
    final dashboard = find.byType(DashboardContainer);
    expect(dashboard, findsOneWidget);
    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureFeatureItemMatcher(
            widget, 'Transfer', Icons.monetization_on_outlined));
    expect(transferFeatureItem, findsOneWidget);
    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();
    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);
    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();
    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);
    final nameTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Full name';
      }
      return false;
    });
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Fábio');
    final accountNumberTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Account number';
      }
      return false;
    });
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(accountNumberTextField, '1000');
    final createButton = find.widgetWithText(RaisedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    final contactListBack = find.byType(ContactsList);
    expect(contactListBack, findsOneWidget);
  });
}
