import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app1/app/app.dart';

void main()
{
  testWidgets("Hello World Tester" , (WidgetTester tester ) async{
    await tester.pumpWidget(const MyApp());
    expect(find.byType(Container), findsOneWidget);
  });
}