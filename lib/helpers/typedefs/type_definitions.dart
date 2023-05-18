import 'package:fpdart/fpdart.dart';

import '../generics/error_result.dart';

typedef FutureEither<T> = Future<Either<ErrorResult, T>>;
