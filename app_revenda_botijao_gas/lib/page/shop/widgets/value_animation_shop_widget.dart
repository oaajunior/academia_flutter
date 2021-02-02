import 'package:flutter/widgets.dart';
import '../../home/home_page.dart';

class ValueAnimationShopWidget extends ImplicitlyAnimatedWidget {
  final double value;
  ValueAnimationShopWidget({
    Key key,
    this.value,
  }) : super(duration: Duration(seconds: 1), curve: Curves.linear, key: key);
  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _ValueAnimation();
  }
}

class _ValueAnimation
    extends AnimatedWidgetBaseState<ValueAnimationShopWidget> {
  Tween _count;
  @override
  Widget build(BuildContext context) {
    double value = _count.evaluate(animation);
    return Text('${value.toStringAsFixed(2)?.replaceFirst('.', ',') ?? 0.0}')
        .customText(
      fontSize: 62,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  void forEachTween(visitor) {
    _count =
        visitor(_count, widget.value, (dynamic value) => Tween(begin: value));
  }
}
