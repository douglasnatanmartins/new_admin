// ignore_for_file: unused_import

import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/views/categorias/components/update_category.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/button_edit.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:get_it/get_it.dart';
import 'package:pluto_grid/pluto_grid.dart';

class DatatableProdutos extends StatelessWidget {
  DatatableProdutos(
      {super.key,
      required this.list,
      required this.refresh});

  final List<ProductEntity> list;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      rowColorCallback: (PlutoRowColorContext rowColorContext) {
        return rowColorContext.row.cells['situacao']?.value == 'Inativo'
            ? Colors.red.withOpacity(0.3)
            : Colors.white;
      },
      columns: columns
        ..add(
          PlutoColumn(
              title: '',
              field: 'edit',
              type: PlutoColumnType.text(),
              enableEditingMode: false,
              width: 70,
              minWidth: 75,
              renderer: (renderContext) {
                return CustomButtonEdit(
                  onPressed: () async {
                  /*  final CategoryEntity categoryEntity = list.firstWhere((e) =>
                        e.idCategoria ==renderContext.row.cells.entries.
                        elementAt(0).value.value);

                    final controller = GetIt.I<CategoryController>();

                    await showDialog<bool>(
                        context: context,
                        builder: (_) => UpdateCategory(
                              controller: controller,
                              categoryEntity: categoryEntity,
                              refres: refresh,
                            ));
                            */
                  },
                );
              }),
        ),
      rows: list.map((e) {
        return PlutoRow(cells: {
          'idProduto': PlutoCell(value: e.idProduto.toString()),
          'codigo': PlutoCell(value: e.codigo),
          'descricao': PlutoCell(value: e.descricao),
          'estoque' : PlutoCell(value: e.quantidadeestoque),
          'preco_venda': PlutoCell(value: UtilBrasilFields.obterReal(e.precovenda!.toDouble())),
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
        width: 70,
        title: 'ID',
        field: 'idProduto',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
        PlutoColumn(
        width: 100,
        title: 'Codigo',
        field: 'codigo',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
        width: 225,
        title: 'Descrição',
        field: 'descricao',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
        PlutoColumn(
        width: 110,
        title: 'Estoque',
        field: 'estoque',
        type: PlutoColumnType.number(),
        enableEditingMode: false ),
        PlutoColumn(
        width: 140,
        title: 'Preço Venda',
        field: 'preco_venda',
        type: PlutoColumnType.text(),
        enableEditingMode: false ),
    PlutoColumn(
        width: 100,
        title: 'Situação',
        field: 'situacao',
        type: PlutoColumnType.text(),
        enableEditingMode: false),
    PlutoColumn(
        width: 150,
        title: 'Data Movimento',
        field: 'createdAt',
        type: PlutoColumnType.date(format: 'dd/MM/yyyy'),
        enableEditingMode: false),
    PlutoColumn(
        width: 150,
        title: 'Últi. Atualização',
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
