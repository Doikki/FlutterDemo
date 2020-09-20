import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/list/bean/item_detail_bean.dart';
import 'package:flutter_app/list/item/state.dart';
import 'action.dart';
import 'state.dart';

Effect<ListState> buildEffect() {
  return combineEffects(<Object, Effect<ListState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<ListState> ctx) async {
  String apiUrl = "https://www.wanandroid.com/project/list/1/json";
  Response response = await Dio().get(apiUrl);
  var itemDetailBean =
      ItemDetailBean.fromJson(json.decode(response.toString()));
  var itemDetails = itemDetailBean.data.datas;
  var items = List.generate(
      itemDetails.length,
      (index) => ItemState(
          itemDetail: itemDetails[index],
          index: index,
          total: itemDetails.length));
  ctx.dispatch(ListActionCreator.updateItem(items));
}
