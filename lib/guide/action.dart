import 'package:fish_redux/fish_redux.dart';

enum GuideAction {
  toCount,
  toList,

}

class GuideActionCreator {
  static Action toCount() {
    return Action(GuideAction.toCount);
  }

  static Action toList() {
    return Action(GuideAction.toList);
  }
}
