/// T : Result Type
/// Params : 파라미터 타입
abstract interface class UseCase<T, Params> {
  Future<T> execute(Params params);
}

/// IO
/// I : Input
/// O : Output
// abstract interface class UseCase2<I, O> {
//   Future<O> execute(I input);
// }
