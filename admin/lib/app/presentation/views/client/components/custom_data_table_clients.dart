// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/presentation/controllers/client_controller.dart';
import 'package:admin/app/presentation/views/client/components/update_client.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/button_edit.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog_message.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter/material.dart' as m;

class CustomDatatableClients extends StatelessWidget {
  CustomDatatableClients(
      {super.key,
      required this.list,
      required this.controller,
      required this.refresh});

  final List<ClientEntity> list;
  final ClientController controller;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return m.Material(
      child: PlutoGrid(
        rowColorCallback: (PlutoRowColorContext rowColorContext) {
          return rowColorContext.row.cells['status']?.value == 'Inativo'
              ? Colors.red.withOpacity(0.5)
              : Colors.white;
        },
        columns: columns
          ..add(
            PlutoColumn(
                title: 'Ações',
                field: 'edit',
                type: PlutoColumnType.text(),
                enableEditingMode: false,
                width: 75,
                minWidth: 75,
                renderer: (renderContext) {
                  return CustomButtonEdit(
                    onPressed: () async {
                      //Encontrando o Cliente na lista
                      final ClientEntity clientEntity = list.firstWhere((e) =>
                          e.idcliente ==renderContext.row.cells.entries.elementAt(0)
                              .value.value as int);

                      ///Consultando o Endereço        
                      await controller.getEnderecoByID(context, clientEntity.idendereco!)
                          .then((endereco) async {
                            await controller.getAllEstados(context);
                            //
                              if (endereco != null) {
                                //Inicializando SETTERS
                                controller.initializeFunction(
                                    client: clientEntity, endereco: endereco);
                                //Chamando o Dialogo de Edição
                                await m.showDialog<bool>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) => UpdateClients(
                                          controller: controller,
                                          refresh: refresh,
                                          clientEntity: clientEntity,
                                          enderecoEntity: endereco,
                                        ));
                                //
                              } else {
                                CustomDialogMessage.show(
                                    context: context,
                                    message:'Endereço não encontrado para o Cliente');
                              }
                      });
                    },
                  );
                }),
          ),
        rows: list.map((e) {
          return PlutoRow(cells: {
            'id': PlutoCell(value: e.idcliente),
            'name': PlutoCell(value: e.nome),
            'email': PlutoCell(value: e.email),
            'status': PlutoCell(value: e.situacao! == 1 ? 'Ativo' : 'Inativo'),
            'type': PlutoCell(
                value:
                    e.tipocliente! == 1 ? 'Pessoa Fisica' : 'Pessoa Juridica'),
            'phone': PlutoCell(value: e.telefone),
            'createdAt': PlutoCell(value: '${e.createdat!}'),
            'updatedAt':
                PlutoCell(value: e.updatedat == null ? '' : '${e.updatedat}'),
            'edit': PlutoCell(),
          });
        }).toList(),
        configuration: PlutoGridConfiguration(
          scrollbar: const PlutoGridScrollbarConfig(),
          columnFilter: PlutoGridColumnFilterConfig(
            filters: const [
              ...FilterHelper.defaultFilters,
              // custom filter
              ClassYouImplemented(),
            ],
            resolveDefaultColumnFilter: (column, resolver) {
              if (column.field == 'text') {
                return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
              } else if (column.field == 'number') {
                return resolver<PlutoFilterTypeGreaterThan>()
                    as PlutoFilterType;
              } else if (column.field == 'date') {
                return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
              } else if (column.field == 'select') {
                return resolver<ClassYouImplemented>() as PlutoFilterType;
              }
              return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
            },
          ),
        ),
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setShowColumnFilter(true);
        },
      ),
    );
  }

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      width: 80,
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.text(),
      enableFilterMenuItem: false,
    ),
    PlutoColumn(
      width: 210,
      title: 'Nome',
      field: 'name',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
    ),
    PlutoColumn(
      width: 210,
      title: 'E-mail',
      field: 'email',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
    ),
    PlutoColumn(
        width: 160,
        title: 'Telefone',
        field: 'phone',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
        width: 100,
        title: 'Situação',
        field: 'status',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
        width: 130,
        title: 'Tipo Pessoa',
        field: 'type',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
        width: 150,
        title: 'Data Atualização',
        field: 'updatedAt',
        type: PlutoColumnType.date(format: 'dd/MM/yyyy'),
        enableEditingMode: false),
  ];
}

class ClassYouImplemented implements PlutoFilterType {
  @override
  String get title => 'Pesquisar';

  @override
  get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn? column,
      }) {
        var keys = search!.split(',').map((e) => e.toUpperCase()).toList();

        return keys.contains(base!.toUpperCase());
      };

  const ClassYouImplemented();
}
