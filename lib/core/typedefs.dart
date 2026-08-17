import 'package:fpdart/fpdart.dart';

import 'error/failure.dart';

typedef Result<T> = Either<Failure, T>;
