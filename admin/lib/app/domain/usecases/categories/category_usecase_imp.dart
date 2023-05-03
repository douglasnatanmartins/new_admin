import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/category_repository.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:dartz/dartz.dart';

class CategoryUsecaseImp implements CategoryUsecase {
  final CategoryRepository _categoryRepository;
  CategoryUsecaseImp(this._categoryRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> findAll({bool? isActive}) async {
    return await _categoryRepository.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, CategoryEntity>> findOne() {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(CategoryEntity category) async {
    return await _categoryRepository.saveOrUpdate(category);
  }

}