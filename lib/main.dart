import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart'hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_app/guide/page.dart';
import 'package:flutter_app/list/page.dart';

import 'count/page.dart';
void main() {
  runApp(createApp());
}

Widget createApp() {
  return MaterialApp(
    title: 'FishDemo',
    home: RouteConfig.routes.buildPage(RouteConfig.guidePage, null), //作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      //ios页面切换风格
      return CupertinoPageRoute(builder: (BuildContext context) {
        return RouteConfig.routes.buildPage(settings.name, settings.arguments);
      });
//      Material页面切换风格
//      return MaterialPageRoute<Object>(builder: (BuildContext context) {
//        return routes.buildPage(settings.name, settings.arguments);
//      });
    },
  );
}

class RouteConfig {
  static const String guidePage = 'page/guide';
  static const String countPage = 'page/count';
  static const String listPage = 'page/list';
  ///定义路由
  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      RouteConfig.guidePage: GuidePage(),
      RouteConfig.countPage: CountPage(),
      RouteConfig.listPage: ListPage(),
    },
  );
}