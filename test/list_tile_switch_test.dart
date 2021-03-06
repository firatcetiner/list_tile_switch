import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

void main() {
  group(
    'Test Widgets',
    () {
      testWidgets(
        'ListTile with CupertinoSwitch',
        (WidgetTester tester) async {
          Widget testWidget = MaterialApp(
            home: Material(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: ListTileSwitch(
                  value: true,
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  onLongPress: () {
                    print('Long Press');
                  },
                  toggleSelectedOnValueChange: true,
                  contentPadding: EdgeInsets.zero,
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
        },
      );

      testWidgets(
        'ListTile with MaterialSwitch',
        (WidgetTester tester) async {
          Widget testWidget = MaterialApp(
            home: Material(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: ListTileSwitch(
                  value: true,
                  title: const Text('Title'),
                  subtitle: const Text('Subtitle'),
                  autoFocus: false,
                  selected: true,
                  switchInactiveColor: Colors.black,
                  leading: Icon(Icons.message),
                  switchActiveColor: Colors.pink,
                  switchType: SwitchType.material,
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
          expect(find.byType(Switch), findsOneWidget);
        },
      );

      testWidgets(
        'ListTile with CustomSwitch',
        (WidgetTester tester) async {
          Widget testWidget = MaterialApp(
            home: Material(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: ListTileSwitch(
                  value: true,
                  title: const Text('CustomSwitch'),
                  autoFocus: false,
                  selected: true,
                  switchInactiveColor: Colors.black,
                  leading: Icon(Icons.message),
                  switchActiveColor: Colors.pink,
                  switchType: SwitchType.custom,
                  onChanged: (value) {},
                ),
              ),
            ),
          );
          await tester.pumpWidget(testWidget);
          expect(find.text('CustomSwitch'), findsOneWidget);
          expect(find.byType(ListTileTheme), findsOneWidget);
          expect(find.byIcon(Icons.message), findsOneWidget);
          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(CustomSwitch), findsOneWidget);
          expect(find.byType(Stack), findsOneWidget);
          expect(find.byType(GestureDetector), findsNWidgets(2));
          expect(find.byType(AnimatedContainer), findsOneWidget);
          expect(find.byType(Container), findsNWidgets(2));
          expect(find.byType(AnimatedAlign), findsOneWidget);
          expect(find.byType(Stack), findsOneWidget);
        },
      );
    },
  );
}
