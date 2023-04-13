// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/domain/usecases/client/client_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mobx/mobx.dart';
part 'client_controller.g.dart';

class ClientController = _ClientControllerBase with _$ClientController;

abstract class _ClientControllerBase with Store {

  final ClientUsecase _clientUsecase;
  _ClientControllerBase(this._clientUsecase);

  @action
  Future<List<ClientEntity>> getAll(BuildContext context) async {
    final result = await _clientUsecase.getAll(false);
    if(result.isLeft()){
      CustomSnackbar.show(
        context: context, message: result.getLeft().message);
      return [];
    } else {
      return result.getRight();
    }
  }
}