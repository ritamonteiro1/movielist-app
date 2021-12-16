import 'package:flutter/material.dart';
import 'package:teste_tokenlab/presentation/common/loading_widget_view.dart';

class AsyncSnapshotMoviesResponseView<Loading, Error, Success>
    extends StatelessWidget {
  AsyncSnapshotMoviesResponseView({
    required this.successWidgetBuilder,
    required this.snapshot,
    required this.errorWidget,
    Key? key,
  })  : assert(Loading != dynamic),
        assert(Error != dynamic),
        assert(Success != dynamic),
        super(key: key);

  final AsyncSnapshot snapshot;
  final Widget errorWidget;
  final Widget Function(BuildContext context, Success success)
      successWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final snapshotData = snapshot.data;
    if (snapshotData == null || snapshotData is Loading) {
      return const LoadingWidgetView(key: ValueKey('loading-widget'));
    }

    if (snapshotData is Error) {
      return errorWidget;
    }

    if (snapshotData is Success) {
      return successWidgetBuilder(context, snapshotData);
    }
    throw UnknownStateTypeException();
  }
}

class UnknownStateTypeException implements Exception {}
