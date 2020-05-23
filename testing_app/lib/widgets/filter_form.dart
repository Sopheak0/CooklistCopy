import 'package:flutter/material.dart';
import 'package:testingapp/util/constant.dart';

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  var _valueDuration = 0.0;
  var _valueCalories = 0.0;
  _durationSlider() {
    var theme = Theme.of(context);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Constant.primaryColor[700],
        inactiveTrackColor: Constant.primaryColor[100],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Constant.primaryColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Constant.primaryColor.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        value: _valueDuration,
        onChanged: (value) {
          setState(() {
            _valueDuration = value;
          });
        },
        min: 0.0,
        max: 60.0,
      ),
    );
  }

  _caloriesSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Constant.primaryColor[700],
        inactiveTrackColor: Constant.primaryColor[100],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Constant.primaryColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Constant.primaryColor.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        value: _valueCalories,
        onChanged: (value) {
          setState(() {
            _valueCalories = value;
          });
        },
        min: 0.0,
        max: 2000.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
//      padding: EdgeInsets.all(15),
      height: 700,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Filter',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 12,
            thickness: 1,
            endIndent: 12,
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Cook Durations',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0-${_valueDuration.toInt()} minutes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '0',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '60',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                _durationSlider()
              ],
            ),
          ),
          Divider(
            indent: 12,
            thickness: 1,
            endIndent: 12,
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Calories',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0-${_valueCalories.toInt()} calories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '0',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '2000',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                _caloriesSlider()
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {},
              child: Text(
                'Show 743 Recipes',
                style: TextStyle(color: Colors.white),
              ),
              color: theme.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
