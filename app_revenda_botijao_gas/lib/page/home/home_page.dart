import 'package:flutter/material.dart';
import 'package:screen_utils/screen_utils.dart' as screenUtils;
import './widgets/appbar_home_widget.dart';
import 'widgets/address_home_widget.dart';
import '../../page/home/widgets/list_fornecedor_home_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    screenUtils.Adapt.setWidth(1080);
    screenUtils.Adapt.setHeight(1920);
    screenUtils.Adapt.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBarHomeWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressHomeWidget(),
            ListFornecedorHomeWidget(),
          ],
        ),
      ),
    );
  }
}

extension TextDisplayed on Text {
  Text customText(
      {double fontSize, TextAlign align, Color color, FontWeight fontWeight}) {
    if (this is Text) {
      Text t = this;
      return Text(
        t.data,
        textAlign: align,
        textScaleFactor: screenUtils.Adapt().scaleText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      );
    }
    return null;
  }
}

extension SizeScreen on double {
  double sizeHeightScreen() {
    double fator = this;
    return (screenUtils.Adapt.screenHeightDp -
            (AppBarHomeWidget().preferredSize.height +
                screenUtils.Adapt.statusBarHeight +
                screenUtils.Adapt.bottomBarHeight)) *
        fator;
  }

  double sizeWidthScreen() {
    double fator = this;
    return (screenUtils.Adapt.screenWidthDp * fator);
  }
}
