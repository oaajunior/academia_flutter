import 'package:app_revenda_botijao_gas/page/home/home_page.dart';
import 'package:flutter/material.dart';

import 'page/shop/shop_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var arguments = settings.arguments;
  var builder;
  switch (settings.name) {
    case HomePage.routeName:
      builder = (context) => HomePage();
      break;
    case ShopPage.routeName:
      builder = (context) => ShopPage(arguments);
      break;
  }

  return MaterialPageRoute(
    builder: builder,
    settings: settings,
  );
}
