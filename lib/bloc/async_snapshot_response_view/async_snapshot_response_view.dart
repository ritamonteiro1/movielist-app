import 'package:flutter/material.dart';
import 'package:teste_tokenlab/view/shared_views/error_view/error_widget_view.dart';
import 'package:teste_tokenlab/view/shared_views/loading_view/loading_widget_view.dart';

class AsyncSnapshotResponseView<Loading, Error, Success>
    extends StatelessWidget {
  AsyncSnapshotResponseView({
    required this.successWidgetBuilder,
    required this.snapshot,
    required this.onTryAgainTap,
    Key? key,
  })  : assert(Loading != dynamic),
        assert(Error != dynamic),
        assert(Success != dynamic),
        super(key: key);

  final AsyncSnapshot snapshot;
  final GestureTapCallback onTryAgainTap;
  final Widget Function(BuildContext context, Success success)
  successWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final snapshotData = snapshot.data;
    if (snapshotData == null || snapshotData is Loading) {
      return const LoadingWidget();
    }

    if (snapshotData is Error) {
      return ErrorViewWidget(function: onTryAgainTap);
    }

    if (snapshotData is Success) {
      return successWidgetBuilder(context, snapshotData);
    }
    throw UnknownStateTypeException();
  }
}

class UnknownStateTypeException implements Exception {}