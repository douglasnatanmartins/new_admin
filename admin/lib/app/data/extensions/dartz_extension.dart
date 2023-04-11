import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  R getRight() => (this as Right).value; 
  L getLeft() => (this as Left).value;
}