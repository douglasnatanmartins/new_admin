import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/presentation/views/categorias/category_view.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryUsecase {
  Future<Either<Failure, List<CategoryEntity>>> findAll({bool? isActive});
  Future<Either<Failure, CategoryEntity>> findOne();
  Future<Either<Failure, bool>> saveOrUpdate(CategoryEntity category);
}