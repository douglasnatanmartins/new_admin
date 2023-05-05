import 'package:admin/app/data/data_sources/product_datasource.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductDatasource _datasource;
  ProductRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, List<ProductEntity>>> findAll({bool? isActive}) async {
    return await _datasource.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, ProductEntity>> findOne(int id) async {
    return await _datasource.findOne(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(ProductEntity product) async {
    return await _datasource.saveOrUpdate(product);
  }
}
