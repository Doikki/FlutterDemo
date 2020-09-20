import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/list/bean/item_detail_bean.dart';

class ItemState implements Cloneable<ItemState> {
  Datas itemDetail;
  int index;
  int total;

  ItemState({this.itemDetail, this.index, this.total});

  @override
  ItemState clone() {
    return ItemState()
      ..itemDetail = itemDetail
      ..index = index
      ..total = total;
  }
}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
