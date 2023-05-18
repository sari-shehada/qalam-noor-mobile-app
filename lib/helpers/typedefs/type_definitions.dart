import 'package:fpdart/fpdart.dart';
import 'package:qalam_noor_parents/helpers/generics/error_result.dart';

typedef FutureEither<T> = Future<Either<ErrorResult, T>>;
