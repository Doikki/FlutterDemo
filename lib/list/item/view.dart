import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return _bodyWidget(state);
}

Widget _bodyWidget(ItemState state) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 5,
    margin: _edgeInsetsGeometry(state.index, state.total),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 80,
          height: 60,
          child: Image.network(
            state.itemDetail.envelopePic,
            fit: BoxFit.fill,
          ),
        ),
        _rightContent(state),
      ],
    ),
  );
}

EdgeInsetsGeometry _edgeInsetsGeometry(int index, int total) {
  if (index == total - 1) {
    return EdgeInsets.all(16);
  } else {
    return EdgeInsets.only(left: 16, right: 16, top: 16);
  }
}

Widget _rightContent(ItemState state) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(5),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.itemDetail.title,
                  style: TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Expanded(
              flex: 4,
              child: Text(
                state.itemDetail.desc,
                style: TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "作者：",
                        style: TextStyle(fontSize: 12),
                      ),
                      Expanded(
                          child: Text(
                        state.itemDetail.author,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "时间：",
                        style: TextStyle(fontSize: 12),
                      ),
                      Expanded(
                          child: Text(
                        state.itemDetail.niceDate,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
