import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/views/categorias/components/add_category.dart';
import 'package:admin/app/presentation/views/categorias/components/data_table_categories.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_header.dart';
import 'package:admin/app/presentation/widgets/custom_widgets/empty_data.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get_it/get_it.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.context});

  final BuildContext context;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _controller = GetIt.I<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: CustomHeader(title: 'CATEGORIAS'),
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                FilledButton(
                  child: Text('+ Adicionar'.toUpperCase()),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => ADDCategory(
                              refres: () => setState(() {}),
                            ));
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Divider(),
          ),
          Expanded(
            child: FutureBuilder(
                // initialData: const <CategoryEntity>[],
                future: _controller.findAll(widget.context),
                builder: (_, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(
                        child: material.CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.data!.isEmpty) {
                        return const EmptyData();
                      } else {
                        return material.Material(
                          color: Colors.grey[60],
                          child: material.Padding(
                            padding: const EdgeInsets.all(4),
                            child: DatatableCategories(
                                list: snapshot.data!,
                                refresh: () => setState(() {})),
                          ),
                        );
                      }
                  }
                }),
          )
        ],
      ),
    );
  }
}
