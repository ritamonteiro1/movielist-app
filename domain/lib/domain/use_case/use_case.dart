import 'package:meta/meta.dart';

abstract class UseCase<P, R> {
  @protected
  Future<R> getRawFuture({required P params});

  Future<R> getFuture({required P params}) => getRawFuture(params: params);
}
