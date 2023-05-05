// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/product_repository.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:dartz/dartz.dart';

class ProductUsecaseImp implements ProductUsecase {
  final ProductRepository _productRepository;
  ProductUsecaseImp(this._productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> findAll({bool? isActive}) async {
    return await _productRepository.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, ProductEntity>> findOne(int id) async {
    return await _productRepository.findOne(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(ProductEntity product) async {
    
    if(product == null){
      return Left(Failure('A entidade produto não pode ser Nula!'
      'Contate o Administrador.'));
    }

    if(product.idProduto == null){
      if(product.codigo == null || product.descricao == null ||
      product.idCategoria == null || product.idunidadeMedida == null){
        return Left(Failure('Existem campos nulos no produto!'
      'Contate o Administrador.'));
      }

      if(product.codigo!.isEmpty|| product.descricao!.isEmpty){
        return Left(Failure('Existem campos vazios no produto! Verifique ou '
      'Contate o Administrador.'));
      }

      return await _productRepository.saveOrUpdate(product);
    } else {

      if( product.idCategoria == null || product.codigo == null || 
      product.descricao == null || product.idCategoria == null || 
      product.idunidadeMedida == null){
        return Left(Failure('Existem campos nulos no produto!'
      'Contate o Administrador.'));
      }

      if(product.codigo!.isEmpty|| product.descricao!.isEmpty){
        return Left(Failure('Existem campos vazios no produto! Verifique ou '
      'Contate o Administrador.'));
      }

      return await _productRepository.saveOrUpdate(product);
    }
  }
}
