import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

// ...

List<Item> _data = generateItems(8);

class PrimaryCategpry extends StatefulWidget {
  final String title;

  const PrimaryCategpry({Key key, this.title}) : super(key: key);

  @override
  _PrimaryCategpryState createState() => _PrimaryCategpryState();
}

class _PrimaryCategpryState extends State<PrimaryCategpry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(child: Container(child: _buildPanel())));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {},
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
              onTap: () {
                setState(() {
                  _data = _data.map((d){
                    if(d == item) {
                      return d..isExpanded = true;
                    }
                    return d..isExpanded = false;
                  }).toList();
                });
              },
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            // subtitle: Text('To delete this panel, tap the trash can icon'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
