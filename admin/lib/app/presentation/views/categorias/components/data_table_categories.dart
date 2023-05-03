import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class DatatableCategories extends StatelessWidget {
  DatatableCategories(
      {super.key,
      required this.list,
      required this.controller,
      required this.refresh});

  final List<CategoryEntity> list;
  final CategoryController controller;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
     rowColorCallback: (PlutoRowColorContext rowColorContext) {
        return rowColorContext.row.cells['situacao']?.value == 0
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
              width: 100,
              minWidth: 75,
              renderer: (renderContext) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: renderContext.row.cells.entries
                                    .elementAt(5)
                                    .value
                                    .value ==
                                'Inativo'
                            ? Colors.blue
                            : Colors.yellow.shade900),
                    onPressed: () async {
                      /*
                      final ClientModel clientModel = list.firstWhere((e) =>
                          e.idcliente == renderContext.row.cells.entries.elementAt(0).value.value);

                      final AddressModel? addressModel = await AddressRepository()
                              .getAddressByIdUser(clientModel.idcliente!);

                      if (addressModel != null) {
                        controller.setInitialValue(
                            clientModel: clientModel,
                            addressModel: addressModel);
                        await showDialog<bool>(
                            context: context,
                            builder: (_) => UpdateClient(
                                  controller: controller,
                                  clientModel: clientModel,
                                  addressModel: addressModel,
                                  refresh: refresh,
                                ));
                      }
                      */
                    },
                    child: const Text('Editar'));
              }),
        ),
      rows: list.map((e) {
        return PlutoRow(cells: {
          'id': PlutoCell(value: e.idCategoria),
          'name': PlutoCell(value: e.nome),
          'situacao': PlutoCell(value: e.situacao! == 1 ? 'Ativo' : 'Inativo'),
          'createdAt': PlutoCell(value: '${e.createdAt!}'),
          'updatedAt':
              PlutoCell(value: e.updatedAt == null ? '' : '${e.updatedAt}'),
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
              return resolver<PlutoFilterTypeGreaterThan>() as PlutoFilterType;
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
    );
  }

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
       // width: 120,
        title: 'Id Categoria',
        field: 'id',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
       // width: 200,
        title: 'Nome',
        field: 'name',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        enableFilterMenuItem: true),
    PlutoColumn(
     //   width: 110,
        title: 'Situação',
        field: 'situacao',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
      //  width: 150,
        title: 'Data Registro',
        field: 'createdAt',
        type: PlutoColumnType.date(format: 'dd-MM-yyyy'),
        enableEditingMode: false),
    PlutoColumn(
      //  width: 150,
        title: 'Data Atualização',
        field: 'updatedAt',
        type: PlutoColumnType.date(format: 'dd-MM-yyyy'),
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
