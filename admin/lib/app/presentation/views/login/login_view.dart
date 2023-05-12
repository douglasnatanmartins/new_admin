// ignore_for_file: override_on_non_overriding_member

import 'package:admin/app/presentation/controllers/login_controller.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_box.dart';
import 'package:admin/app/utils/shared_prefernces/shared_pref.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart' as m;
import 'package:window_manager/window_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with WindowListener {
  final LoginController _controller = GetIt.I<LoginController>();

  final FocusNode _save = FocusNode();

  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Row(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter:
                        ColorFilter.mode(Colors.transparent, BlendMode.srcOver),
                    image: AssetImage('assets/img/login.jpg'))),
          )),
          Expanded(
              child: Container(
            color: Colors.grey[50],
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              margin: EdgeInsets.only(left: constraints.maxWidth / 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bem vindo de volta!',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Faça login na seu usuário e senha',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Observer(
                      builder: (_) => CustomTextBox(
                            readOnly: _controller.isLoading,
                            padding: EdgeInsets.only(
                                left: 0,
                                top: 30,
                                right: constraints.maxWidth / 9),
                            label: 'Usuario',
                            placeholder: 'Usuário',
                            isLogin: true,
                            error: _controller.userValido,
                            onChanged: _controller.setName,
                          )),
                  Observer(builder: (_) {
                    return CustomTextBox(
                      readOnly: _controller.isLoading,
                      padding: EdgeInsets.only(
                          left: 0, top: 30, right: constraints.maxWidth / 9),
                      label: 'Senha',
                      placeholder: '******',
                      isLogin: true,
                      obscureText: true,
                      error: _controller.passValido,
                      onChanged: _controller.setPassWord,
                      onEditingComplete: () => _save.requestFocus(),
                    );
                  }),
                  Container(
                    margin: EdgeInsets.only(
                        right: constraints.maxWidth / 9.5, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        m.TextButton(
                          onPressed: _controller.isLoading ? null : () {},
                          child: const Text('Recuperar minha senha!'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, right: constraints.maxWidth / 9),
                    child: Observer(builder: (_) {
                      return FilledButton(
                          focusNode: _save,
                          style: ButtonStyle(
                              padding: ButtonState.all(
                                  const EdgeInsets.symmetric(vertical: 10))),
                          onPressed: _controller.isLoading
                              ? null
                              : _controller.isFormValid
                                  ? () async => await _controller.login(context)
                                  : null,
                          child: const Text(
                            'ENTRAR',
                            style: TextStyle(fontSize: 16),
                          ));
                    }),
                  ),
                  Observer(builder: (_) {
                    if (_controller.userError != null) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 30, right: constraints.maxWidth / 10),
                        child: Text(
                          _controller.userError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                  Observer(builder: (_) {
                    if (_controller.passError != null) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10, right: constraints.maxWidth / 10),
                        child: Text(
                          _controller.passError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ))
        ],
      );
    });
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context ,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirmar fechamento'),
            content:
                const Text('Tem certeza de que deseja fechar a aplicação?'),
            actions: [
              FilledButton(
                child: const Text('Sim'),
                onPressed: () async {
                  Navigator.pop(context);
                  await SharedPref().removeInfoUser();
                  await windowManager.destroy();
                },
              ),
              Button(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
