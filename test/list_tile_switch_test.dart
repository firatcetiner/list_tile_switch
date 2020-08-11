import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

void main() {
  testWidgets('Finds widgets on ListTileSwitch', (WidgetTester tester) async {
    Widget testWidget = MaterialApp(
      home: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListTileSwitch(
            value: true,
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.message),
            switchActiveColor: Colors.pink,
            switchType: SwitchType.cupertino,
            onChanged: (value) {},
          ),
        ),
      ),
    );
    await tester.pumpWidget(testWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.byIcon(Icons.message), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });
}
