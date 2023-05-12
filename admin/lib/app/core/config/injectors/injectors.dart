import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/data_sources/category_datasource.dart';
import 'package:admin/app/data/data_sources/cidade_estado_pais_datasource.dart';
import 'package:admin/app/data/data_sources/client_datasource.dart';
import 'package:admin/app/data/data_sources/endereco_datasource.dart';
import 'package:admin/app/data/data_sources/estoque_datasource.dart';
import 'package:admin/app/data/data_sources/generate_codes_datasource.dart';
import 'package:admin/app/data/data_sources/product_datasource.dart';
import 'package:admin/app/data/data_sources/unidade_medida_datasource.dart';
import 'package:admin/app/data/database/api_services/auth_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/category_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/cidade_estado_pais_service_imp.dart';
import 'package:admin/app/data/database/api_services/client_api_service_imp.dart';
import 'package:admin/app/data/database/api_services/endereco_api_service_imp.dart';
import 'package:admin/app/data/database/api_services/estoque_api_services_imp.dart';
import 'package:admin/app/data/database/api_services/generate_codes_api_service_imp.dart';
import 'package:admin/app/data/database/api_services/product_api_service_imp.dart';
import 'package:admin/app/data/database/api_services/unidade_medida_api_services_imp.dart';
import 'package:admin/app/data/repositories/auth_repository_imp.dart';
import 'package:admin/app/data/repositories/category_repository_imp.dart';
import 'package:admin/app/data/repositories/cidade_estado_pais_repository_imp.dart';
import 'package:admin/app/data/repositories/client_repository_imp.dart';
import 'package:admin/app/data/repositories/endereco_repository_imp.dart';
import 'package:admin/app/data/repositories/estoque_repository_imp.dart';
import 'package:admin/app/data/repositories/generate_codes_repository_imp.dart';
import 'package:admin/app/data/repositories/product_repository_imp.dart';
import 'package:admin/app/data/repositories/unidade_medida_repository_imp.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:admin/app/domain/repositories/category_repository.dart';
import 'package:admin/app/domain/repositories/cidade_estado_pais_repository.dart';
import 'package:admin/app/domain/repositories/client_repository.dart';
import 'package:admin/app/domain/repositories/endereco_repository.dart';
import 'package:admin/app/domain/repositories/estoque_repository.dart';
import 'package:admin/app/domain/repositories/generate_code_repository.dart';
import 'package:admin/app/domain/repositories/product_repository.dart';
import 'package:admin/app/domain/repositories/unidade_medida_repository.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase_imp.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase_imp.dart';
import 'package:admin/app/domain/usecases/cidade_estado_pais/cidade_estado_pais_usecase.dart';
import 'package:admin/app/domain/usecases/cidade_estado_pais/cidade_estado_pais_usecase_imp.dart';
import 'package:admin/app/domain/usecases/client/client_usecase.dart';
import 'package:admin/app/domain/usecases/client/client_usecase_imp.dart';
import 'package:admin/app/domain/usecases/endereco/endereco_usecase.dart';
import 'package:admin/app/domain/usecases/endereco/endereco_usecase_imp.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase_imp.dart';
import 'package:admin/app/domain/usecases/generate_codes/generate_code_usecase.dart';
import 'package:admin/app/domain/usecases/generate_codes/generate_code_usecase_imp.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:admin/app/domain/usecases/product/product_usecase_imp.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase_imp.dart';
import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/controllers/client_controller.dart';
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
    getIt.registerLazySingleton<ClientDataSource>(() => ClientApiServiceImp());
    getIt.registerLazySingleton<EnderecoDatasource>(() => EnderecoApiServiceImp());
    getIt.registerLazySingleton<UnidadeMedidaDataSource>(() => UnidadeMedidaApiServicesImp());
    getIt.registerLazySingleton<GenerateCodesDatasource>(() => GenerateCodesApiServicesImp());
    getIt.registerLazySingleton<CidadeEstadoPaisDatasource>(() => CidadeEstadoPaisServiceImp());

    ///Repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(getIt()));
    getIt.registerLazySingleton<CategoryRepository>(() => CategoryReposioryImp(getIt()));
    getIt.registerLazySingleton<EstoqueRepository>(() => EstoqueRepositoryImp(getIt()));
    getIt.registerLazySingleton<ClientRepository>(() => ClientRepositoryImp(getIt()));
    getIt.registerLazySingleton<EnderecoRepository>(() => EnderecoRepositoryImp(getIt()));
    getIt.registerLazySingleton<UnidadeMedidaRepository>(() => UnidadeMedidaRepositoryImp(getIt()));
    getIt.registerLazySingleton<GenerateCodesRepository>(() => GenerateCodeRepositoryImp(getIt()));
    getIt.registerLazySingleton<CidadeEstadoPaisRepository>(() => CidadeEstadoPaisRepositoryImp(getIt()));

    ///UseCase
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUsecaseImp(getIt()));
    getIt.registerLazySingleton<ProductUsecase>(() => ProductUsecaseImp(getIt()));
    getIt.registerLazySingleton<CategoryUsecase>(() => CategoryUsecaseImp(getIt()));
    getIt.registerLazySingleton<EstoqueUsecase>(() => EstoqueUsecaseImp(getIt()));
    getIt.registerLazySingleton<ClientUsecase>(() => ClientUsecaseImp(getIt()));
    getIt.registerLazySingleton<EnderecoUsecase>(() => EnderecoUsecaseImp(getIt()));
    getIt.registerLazySingleton<UnidadeMedidaUsecase>(() => UnidadeMedidaUsecaseImp(getIt()));
    getIt.registerLazySingleton<GenerateCodesUsecase>(() => GenerateCodeUsecaseImp(getIt()));
    getIt.registerLazySingleton<CidadeEstadoPaisUsecase>(() => CidadeEstadoPaisUsecaseImp(getIt()));

    ///Controller
    getIt.registerSingleton<LoginController>(LoginController(getIt()));
    getIt.registerSingleton<CategoryController>(CategoryController(getIt()));
    getIt.registerSingleton<ProductController>(
      ProductController(getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerSingleton<ClientController>(ClientController(getIt(), getIt(), getIt()));
  }
}
