import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GuideState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("GuidePage"),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          _jumpButton("toCount", () {
            dispatch(GuideActionCreator.toCount());
          }),
          _jumpButton("toList", () {
            dispatch(GuideActionCreator.toList());
          })
        ],
      ),
    ),
  );
}

Widget _jumpButton(String name, VoidCallback callback) {
  return InkWell(
    customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
    ),
    splashColor: Colors.lightBlueAccent,
    child: RaisedButton(
      color: Colors.blue,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text(name),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
      onPressed: callback,
    ),
  );
}
