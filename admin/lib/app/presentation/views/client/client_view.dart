import 'package:admin/app/presentation/controllers/client_controller.dart';
import 'package:admin/app/presentation/views/client/components/add_client.dart';
import 'package:admin/app/presentation/views/client/components/custom_data_table_clients.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_header.dart';
import 'package:admin/app/presentation/widgets/custom_widgets/empty_data.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get_it/get_it.dart';

class ClientView extends StatefulWidget {
  const ClientView({super.key});

  @override
  State<ClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  final ClientController _controller = GetIt.I<ClientController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: CustomHeader(title: 'clientes'),
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
                  style: ButtonStyle(
                      backgroundColor: ButtonState.all(
                          material.Colors.greenAccent.shade700)),
                  child: Text('+ Adicionar'.toUpperCase()),
                  onPressed: () async {
                    await material.showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => ADDClients(
                              refres: () => setState(() {}),
                            ));
                  },
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20), child: Divider()),
          Expanded(
            child: FutureBuilder(
                future: _controller.getAll(context),
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
                        return CustomDatatableClients(
                            list: snapshot.data!,
                            controller: _controller,
                            refresh: () => setState(() {}));
                      }
                  }
                }),
          )
        ],
      ),
    );
  }
}
