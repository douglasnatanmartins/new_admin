
import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/data_sources/client_datasource.dart';
import 'package:admin/app/data/database/auth_db/auth_db_imp.dart';
import 'package:admin/app/data/database/client_db/client_db_imp.dart';
import 'package:admin/app/data/repositories/auth_repository_imp.dart';
import 'package:admin/app/data/repositories/client_repository_imp.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:admin/app/domain/repositories/client_repository.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase_imp.dart';
import 'package:admin/app/domain/usecases/client/client_usecase.dart';
import 'package:admin/app/domain/usecases/client/client_usecase_imp.dart';
import 'package:admin/app/presentation/controllers/client_controller.dart';
import 'package:admin/app/presentation/controllers/login_controller.dart';
import 'package:get_it/get_it.dart';

class Injectors {

  void setupLocators(){
    
    GetIt getIt = GetIt.instance;

    ///Global Controllers
    getIt.registerLazySingleton<UserManager>(() => UserManager(getIt()));

    ///DataSources
    getIt.registerLazySingleton<AuthDatasource>(() => AuthDbImp());
    getIt.registerLazySingleton<ClientDataSource>(() => ClientDbImp());
    
    ///Repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<ClientRepository>(() => ClientRepositoryImp(getIt()));

    ///UseCase
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUsecaseImp(getIt()));
    getIt.registerLazySingleton<ClientUsecase>(() => ClientUsecaseImp(getIt()));

    ///Controller
    getIt.registerSingleton<LoginController>(LoginController(getIt()));
    getIt.registerSingleton<ClientController>(ClientController(getIt()));

  }
}