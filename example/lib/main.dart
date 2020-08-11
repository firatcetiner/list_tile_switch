import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListTileSwitch Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListTileSwitchExample(title: 'Flutter ListTileSwitch Demo'),
    );
  }
}

class ListTileSwitchExample extends StatefulWidget {
  ListTileSwitchExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListTileSwitchExampleState createState() => _ListTileSwitchExampleState();
}

class _ListTileSwitchExampleState extends State<ListTileSwitchExample> {
  List<bool> _switchValues = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text('ListTileSwitch with only title',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          SizedBox(height: 20),
          ListTileSwitch(
            value: _switchValues[0],
            leading: Icon(Icons.access_alarms),
            onChanged: (value) {
              setState(() {
                _switchValues[0] = value;
              });
            },
            switchActiveColor: Colors.indigo,
            title: Text('Default Custom Switch'),
          ),
          ListTileSwitch(
            value: _switchValues[1],
            leading: Icon(Icons.message),
            onChanged: (value) {
              setState(() {
                _switchValues[1] = value;
              });
            },
            switchActiveColor: Colors.teal,
            switchScale: 0.8,
            switchType: SwitchType.cupertino,
            title: Text('Cupertino Switch'),
          ),
          ListTileSwitch(
            value: _switchValues[2],
            leading: Icon(Icons.build),
            onChanged: (value) {
              setState(() {
                _switchValues[2] = value;
              });
            },
            switchActiveColor: Colors.deepOrange,
            switchType: SwitchType.material,
            title: Text('Material Switch'),
          ),
          SizedBox(height: 20),
          Text('ListTileSwitch with subtitle',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          SizedBox(height: 20),
          ListTileSwitch(
            value: _switchValues[3],
            toggleSelectedOnValueChange: true,
            leading: Icon(Icons.access_alarms),
            onChanged: (value) {
              setState(() {
                _switchValues[3] = value;
              });
            },
            subtitle: Text('This tile is using custom switch and subtitle.'),
            switchActiveColor: Colors.blueGrey,
            title: Text('Custom Switch'),
          ),
          SizedBox(height: 10),
          ListTileSwitch(
            value: _switchValues[4],
            leading: Icon(Icons.message),
            onChanged: (value) {
              setState(() {
                _switchValues[4] = value;
              });
            },
            switchActiveColor: Colors.teal,
            switchScale: 0.8,
            subtitle: Text('This tile is using cupertino switch and subtitle.'),
            switchType: SwitchType.cupertino,
            title: Text('Cupertino Switch'),
          ),
          SizedBox(height: 10),
          ListTileSwitch(
            value: _switchValues[5],
            onChanged: (value) {
              setState(() {
                _switchValues[5] = value;
              });
            },
            toggleSelectedOnValueChange: true,
            subtitle: Text('This tile is using material switch and subtitle.'),
            switchActiveColor: Colors.deepOrange,
            switchType: SwitchType.material,
            title: Text('Material Switch'),
          ),
        ],
      ),
    );
  }
}
