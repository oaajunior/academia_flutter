import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TimeComponent extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onSelectedTime;
  TimeComponent({
    Key key,
    this.date,
    this.onSelectedTime,
  }) : super(key: key);
  @override
  _TimeComponentState createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  final List<String> _hours = List.generate(24, (index) => index++)
      .map((h) => '${h.toString().padLeft(2, '0')}')
      .toList();
  final List<String> _min = List.generate(60, (index) => index++)
      .map((h) => '${h.toString().padLeft(2, '0')}')
      .toList();
  final List<String> _sec = List.generate(60, (index) => index++)
      .map((h) => '${h.toString().padLeft(2, '0')}')
      .toList();
  String _hourSelected;
  String _minSelected;
  String _secSelected;
  var currentDateTime = DateTime.now();

  @override
  void initState() {
    _hourSelected = currentDateTime.hour.toString().padLeft(2, '0');
    _minSelected = currentDateTime.minute.toString().padLeft(2, '0');
    _secSelected = currentDateTime.second.toString().padLeft(2, '0');
    invokeCallback();
    super.initState();
  }

  void invokeCallback() {
    var newDate = DateTime(
      widget.date.year,
      widget.date.month,
      widget.date.day,
      int.parse(_hourSelected),
      int.parse(_minSelected),
      int.parse(_secSelected),
    );
    widget.onSelectedTime(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBox(_hours, currentDateTime.hour, (String value) {
          setState(() {
            _hourSelected = value;
            invokeCallback();
          });
        }),
        _buildBox(_min, currentDateTime.minute, (String value) {
          setState(() {
            _minSelected = value;
            invokeCallback();
          });
        }),
        _buildBox(_sec, currentDateTime.second, (String value) {
          setState(() {
            _secSelected = value;
            invokeCallback();
          });
        }),
      ],
    );
  }

  Widget _buildBox(
      List<String> options, int currentTime, ValueChanged<String> onChanged) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 10,
            color: Theme.of(context).primaryColor,
            offset: Offset(2, 5),
          )
        ],
      ),
      child: ListWheelScrollView(
        overAndUnderCenterOpacity: 0.5,
        onSelectedItemChanged: (value) =>
            onChanged(value.toString().padLeft(2, '0')),
        itemExtent: 60,
        perspective: 0.007,
        physics: FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(
          initialItem: currentTime,
        ),
        children: options
            .map<Text>(
              (elem) => Text(
                elem,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
