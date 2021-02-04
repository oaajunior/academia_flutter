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
  ValueNotifier<String> _hourSelected;
  ValueNotifier<String> _minSelected;
  ValueNotifier<String> _secSelected;
  var currentDateTime = DateTime.now();

  @override
  void initState() {
    _hourSelected =
        ValueNotifier(currentDateTime.hour.toString().padLeft(2, '0'));
    _minSelected =
        ValueNotifier(currentDateTime.minute.toString().padLeft(2, '0'));
    _secSelected =
        ValueNotifier(currentDateTime.second.toString().padLeft(2, '0'));
    invokeCallback();
    super.initState();
  }

  void invokeCallback() {
    var newDate = DateTime(
      widget.date.year,
      widget.date.month,
      widget.date.day,
      int.parse(_hourSelected.value),
      int.parse(_minSelected.value),
      int.parse(_secSelected.value),
    );
    widget.onSelectedTime(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBox(_hours, _hourSelected),
        _buildBox(_min, _minSelected),
        _buildBox(_sec, _secSelected),
      ],
    );
  }

  Widget _buildBox(List<String> option, ValueNotifier<String> timeComponent) {
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
      child: ValueListenableBuilder(
        valueListenable: timeComponent,
        builder: (context, value, child) {
          return ListWheelScrollView(
            overAndUnderCenterOpacity: 0.5,
            onSelectedItemChanged: (value) => {
              timeComponent.value = value.toString().padLeft(2, '0'),
              invokeCallback(),
            },
            itemExtent: 60,
            perspective: 0.007,
            physics: FixedExtentScrollPhysics(),
            controller: FixedExtentScrollController(
              initialItem: int.parse(value),
            ),
            children: option
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
          );
        },
      ),
    );
  }
}
