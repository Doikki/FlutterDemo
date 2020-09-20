import 'package:fish_redux/fish_redux.dart';
import '../main.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/cupertino.dart' hide Action;

Effect<GuideState> buildEffect() {
  return combineEffects(<Object, Effect<GuideState>>{
    GuideAction.toCount: _onCount,
    GuideAction.toList: _toList,
  });
}

void _onCount(Action action, Context<GuideState> ctx) {
  Navigator.pushNamed(ctx.context, RouteConfig.countPage);
}

void _toList(Action action, Context<GuideState> ctx) {
  Navigator.pushNamed(ctx.context, RouteConfig.listPage);
}
