// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:admin/app/presentation/views/product/components/add_product.dart';
import 'package:admin/app/presentation/views/product/components/data_table_produtos.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_header.dart';
import 'package:admin/app/presentation/widgets/custom_widgets/empty_data.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get_it/get_it.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.context});

  final BuildContext context;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final _controller = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: CustomHeader(title: 'PRODUTOS'),
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
                  onPressed: () async {
                    await material.showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (_) => ADDProduct(
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
                              child: DatatableProdutos(
                                list: snapshot.data!,
                                refresh: () {},
                              )),
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
