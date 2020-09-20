import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/list/item/state.dart';

enum ListAction { updateItem }

class ListActionCreator {

  static Action updateItem(var items) {
    return Action(ListAction.updateItem, payload: items);
  }
}
