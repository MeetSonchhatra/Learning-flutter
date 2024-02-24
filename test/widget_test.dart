import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app1/app/app.dart';

void main()
{
  testWidgets("Calculator test" , (WidgetTester tester ) async{
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key("Result")), findsOneWidget);
    expect(find.byKey(const Key("displayone")), findsOneWidget);
    expect(find.byKey(const Key("displaytwo")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add),findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus),findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply),findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide),findsOneWidget);
    await tester.enterText(find.byKey(const Key("displayone")), "20");
    await tester.enterText(find.byKey(const Key("displaytwo")), "10");

    await tester.tap(find.byIcon(CupertinoIcons.add));
    await tester.pump();
    expect(find.text("30"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();
    expect(find.text("10"), findsNWidgets(2));

    await tester.tap(find.byIcon(CupertinoIcons.multiply));
    await tester.pump();
    expect(find.text("200"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));
    await tester.pump();
    expect(find.text("2.0"), findsOneWidget);

  });
}

// testwidget is used for widget testing

// test widget aapde test krye che k aapdne output khbr che pn shu aapde ee code sacho lakhyo che k ny 
// jem k 20 + 10 = 30 pn tester thi ee test thai
