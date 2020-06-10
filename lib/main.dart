import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Favorite City',
        home: FavoriteCity(),
      );
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String _favoriteCity = "";
  List<String> _currencies = ['Rupiah', 'Dollar', 'Ringgit', 'Dirham', 'Yuan'];
  String _dropdownValue = 'Rupiah';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Favorite City')),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (String value) {
                    setState(() {
                      _favoriteCity = value;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                DropdownButton<String>(
                  items: _currencies.map<DropdownMenuItem<String>>(
                      (String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      this._dropdownValue = newValue;
                    });
                  },
                  value: _dropdownValue,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Text('Your favorite city is $_favoriteCity'),
              ],
            ),
          ),
        ),
      );
}
