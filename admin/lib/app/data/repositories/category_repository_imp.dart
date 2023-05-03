import 'package:admin/app/data/data_sources/category_datasource.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryReposioryImp implements  CategoryRepository {
  final CategoryDatasource _categoryDatasource;
  CategoryReposioryImp(this._categoryDatasource);
  @override
  Future<Either<Failure, List<CategoryEntity>>> findAll({bool? isActive}) async {
    return await _categoryDatasource.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, CategoryEntity>> findOne() {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(CategoryEntity category) async  {
    return await _categoryDatasource.saveOrUpdate(category);
  }

}