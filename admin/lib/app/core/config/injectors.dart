
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/database/auth_db/auth_db_imp.dart';
import 'package:admin/app/data/repositories/auth_repository_imp.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase_imp.dart';
import 'package:admin/app/presentation/controllers/login_controller.dart';
import 'package:get_it/get_it.dart';

class Injectors {

  void setupLocators(){
    
    GetIt getIt = GetIt.instance;

    ///DataSources
    getIt.registerLazySingleton<AuthDatasource>(() => AuthDbImp());
    
    ///Repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));

    ///UseCase
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUsecaseImp(getIt()));

    ///Controller
    getIt.registerSingleton<LoginController>(LoginController(getIt()));
  }
}