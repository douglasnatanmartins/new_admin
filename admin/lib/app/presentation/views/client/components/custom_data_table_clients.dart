import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/presentation/controllers/client_controller.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/button_edit.dart';
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
  final Function(bool) refresh;

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
                  /*
                  final ProductEntity productEntity = list.firstWhere((e) =>
                    e.idProduto == renderContext.row.cells.entries.
                    elementAt(0).value.value as int);

                    final controller = GetIt.I<ProductController>();
                    await controller.getFunctionsEditing(context).then((_) async {

                    final category = controller.listCatgeorias.firstWhereOrNull(
                      (c) => c.idCategoria == productEntity.idCategoria);

                    final unitM = controller.listUniMedidas.firstWhereOrNull((u) =>
                      u.idunidadeMedida == productEntity.idunidadeMedida);

                    productEntity.descUnidadeMedida = unitM != null ? unitM.descricao : 'NÃO ENCONTRADO';
                    productEntity.descCategoria = category != null ?  category.descricao : 'NÃO ENCONTRADO';

                    controller.setInitialFunctions(
                      productEntity,category ??  CategoryEntity(idCategoria: 0),
                      unitM ?? UnidadeMedidaEntity(idunidadeMedida: 0));

                      await m.showDialog<bool>(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => UpdateProduct(
                                controller: controller,
                                product: productEntity,
                                refres: refresh,
                              ));
                    });
                    */
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
            'type': PlutoCell(value: e.tipocliente! == 1 ? 'Pessoa Fisica' : 'Pessoa Juridica'),
            'phone': PlutoCell(value: e.telefone),
            'createdAt': PlutoCell(value: '${e.createdat!}'),
            'updatedAt': PlutoCell(value: e.updatedat == null ? '' : '${e.updatedat}'),
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
