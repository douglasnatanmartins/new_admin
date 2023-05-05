import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDatasource{
  Future<Either<Failure, List<ProductEntity>>> findAll({bool? isActive});
  Future<Either<Failure, ProductEntity>> findOne(int id);
  Future<Either<Failure, bool>> saveOrUpdate(ProductEntity product);
}