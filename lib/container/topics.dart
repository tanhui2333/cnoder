import "package:flutter/material.dart";
import "package:redux/redux.dart";
import "package:flutter_redux/flutter_redux.dart";
import "../store/root_state.dart";
import "../store/view_model/topics.dart";
import "../store/view_model/index.dart";
import "../widget/topics.dart";
import "./base.dart";

bool initialized = false;

class TopicsContainer extends StatelessWidget implements InitializeContainer{
  final IndexViewModel vm;

  TopicsContainer({Key key, @required this.vm}):super(key: key);

  void setInitialized() {
    initialized = true;
  }

  bool getInitialized() {
    return initialized;
  }

  void initialize() {
    vm.fetchTopics();
  }

  @override
    Widget build(BuildContext context) {
      return new StoreConnector<RootState, TopicsViewModel>(
        converter: (Store<RootState> store) => TopicsViewModel.fromStore(store),
        builder: (BuildContext context, TopicsViewModel vm) {
          return new TopicsScene(vm: vm);
        },
      );
    }
}