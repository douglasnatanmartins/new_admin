import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/data_sources/category_datasource.dart';
import 'package:admin/app/data/data_sources/estoque_datasource.dart';
import 'package:admin/app/data/data_sources/product_datasource.dart';
import 'package:admin/app/data/data_sources/unidade_medida_datasource.dart';
import 'package:admin/app/data/database/api_services/auth_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/category_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/estoque_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/product_api_service_imp.dart';
import 'package:admin/app/data/database/api_services/unidade_medida_api_services_imp.dart';
import 'package:admin/app/data/repositories/auth_repository_imp.dart';
import 'package:admin/app/data/repositories/category_repository_imp.dart';
import 'package:admin/app/data/repositories/estoque_repository_imp.dart';
import 'package:admin/app/data/repositories/product_repository_imp.dart';
import 'package:admin/app/data/repositories/unidade_medida_repository_imp.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:admin/app/domain/repositories/category_repository.dart';
import 'package:admin/app/domain/repositories/estoque_repository.dart';
import 'package:admin/app/domain/repositories/product_repository.dart';
import 'package:admin/app/domain/repositories/unidade_medida_repository.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase_imp.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase_imp.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase_imp.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:admin/app/domain/usecases/product/product_usecase_imp.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase_imp.dart';
import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/controllers/login_controller.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:get_it/get_it.dart';

class Injectors {
  void setupLocators() {
    GetIt getIt = GetIt.instance;

    ///Global Controllers
    getIt.registerLazySingleton<UserManager>(() => UserManager(getIt()));

    ///DataSources
    getIt.registerLazySingleton<AuthDatasource>(() => AuthApiServicesImp());
    getIt.registerLazySingleton<CategoryDatasource>(() => CatgeoryApiServicesImp());
    getIt.registerLazySingleton<ProductDatasource>(() => ProductApiServiceImp());
    getIt.registerLazySingleton<EstoqueDataSource>(() => EstoqueApiServicesImp());
    getIt.registerLazySingleton<UnidadeMedidaDataSource>(() => UnidadeMedidaApiServicesImp());

    ///Repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(getIt()));
    getIt.registerLazySingleton<CategoryRepository>(() => CategoryReposioryImp(getIt()));
    getIt.registerLazySingleton<EstoqueRepository>(() => EstoqueRepositoryImp(getIt()));
    getIt.registerLazySingleton<UnidadeMedidaRepository>(() => UnidadeMedidaRepositoryImp(getIt()));

    ///UseCase
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUsecaseImp(getIt()));
    getIt.registerLazySingleton<ProductUsecase>(() => ProductUsecaseImp(getIt()));
    getIt.registerLazySingleton<CategoryUsecase>(() => CategoryUsecaseImp(getIt()));
    getIt.registerLazySingleton<EstoqueUsecase>(() => EstoqueUsecaseImp(getIt()));
    getIt.registerLazySingleton<UnidadeMedidaUsecase>(() => UnidadeMedidaUsecaseImp(getIt()));

    ///Controller
    getIt.registerSingleton<LoginController>(LoginController(getIt()));
    getIt.registerSingleton<CategoryController>(CategoryController(getIt()));
    getIt.registerSingleton<ProductController>(ProductController(getIt(), getIt(), getIt()));
  }
}
