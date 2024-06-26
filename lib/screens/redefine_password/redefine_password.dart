import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

import '../../controllers/auth/recover_password.controller.dart';
import '../../ui/index.dart';
import '../../utils/navigator.dart';
import '../widgets/check_line/check_line.dart';
import '../widgets/info_box/info_box.dart';

class RedefinePassword extends StatefulWidget {
  final String bi;
  final String token;

  const RedefinePassword({super.key, required this.bi, required this.token});

  @override
  RedefinePasswordState createState() => RedefinePasswordState();
}

class RedefinePasswordState extends State<RedefinePassword> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final numeric = RegExp(r'[0-9]');
  final symbols = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final upperCaseChar = RegExp(r'[A-Z]');
  final lowCaseChar = RegExp(r'[a-z]');
  final accentLowcase = RegExp(r'[à-ú]');
  final accentUppercase = RegExp(r'[À-Ú]');
  final spaceNull = RegExp(r'[/\s/]');

  final RecoverPasswordController _recoverPasswordController = RecoverPasswordController();

  bool _showNewPassword = true;
  bool _showConfirmPassword = true;

  final bool _passwordIsError = false;

  final String _oldPassword = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  void initState() {
    super.initState();
  }

  void _navigateToScreen() async {
    if (_recoverPasswordController.dataUser!.ok) {
      Nav.push(
        context,
        const EstudanteListaView(),
      );
    } else {
      onError();
    }
  }

  void _changePassword(String password, String token) async {
    await _recoverPasswordController.redefinePassword(password, token);
    if (_recoverPasswordController.dataUser!.ok) {
      _navigateToScreen();
    } else {
      onError();
    }
  }

  void onError() {
    final snackbar = SnackBar(
      backgroundColor: Colors.red,
      content: _recoverPasswordController.dataUser != null
          ? Text(_recoverPasswordController.dataUser!.erros[0])
          : const Text('Erro de serviço'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _onBackPress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: const Text('Você não confirmou as suas alterações, deseja descartá-las?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('SIM'),
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text('NÃO'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = (size.height - MediaQuery.of(context).padding.top) / 100;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Alteração de senha'),
        backgroundColor: const Color(0xffEEC25E),
      ),
      body: PopScope(
        canPop: (_password.isEmpty || _oldPassword.isEmpty || _confirmPassword.isEmpty),
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          _onBackPress();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(screenHeight * 2.5),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: screenHeight * 3, top: screenHeight * 3),
                      child: const AutoSizeText(
                        'Confirme a nova senha abaixo',
                        maxFontSize: 18,
                        minFontSize: 16,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff757575)),
                      ),
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: screenHeight * 4,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: screenHeight * 2),
                            decoration: BoxDecoration(
                              color: const Color(0xfff0f0f0),
                              border: Border(
                                bottom: BorderSide(
                                  color: _passwordIsError ? Colors.red : const Color(0xffD06D12),
                                  width: screenHeight * 0.39,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: _showNewPassword,
                              style: const TextStyle(color: Color(0xff333333), fontWeight: FontWeight.w600),
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  if (spaceNull.hasMatch(value)) {
                                    return 'Senha não pode ter espaço em branco';
                                  }
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: _showNewPassword
                                      ? const Icon(FontAwesomeIcons.eye)
                                      : const Icon(FontAwesomeIcons.eyeSlash),
                                  color: const Color(0xff6e6e6e),
                                  iconSize: screenHeight * 3.0,
                                  onPressed: () {
                                    setState(() {
                                      _showNewPassword = !_showNewPassword;
                                    });
                                  },
                                ),
                                labelText: 'Nova senha',
                                labelStyle: const TextStyle(color: Color(0xff8e8e8e)),
                                errorStyle: const TextStyle(fontWeight: FontWeight.w700),
                                // hintText: "Data de nascimento do aluno",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 4,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: screenHeight * 2),
                            decoration: BoxDecoration(
                              color: const Color(0xfff0f0f0),
                              border: Border(
                                bottom: BorderSide(
                                  color: _passwordIsError ? Colors.red : const Color(0xffD06D12),
                                  width: screenHeight * 0.39,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              style: const TextStyle(color: Color(0xff333333), fontWeight: FontWeight.w600),
                              obscureText: _showConfirmPassword,
                              onChanged: (value) {
                                setState(() {
                                  _confirmPassword = value;
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: _showConfirmPassword
                                      ? const Icon(FontAwesomeIcons.eye)
                                      : const Icon(FontAwesomeIcons.eyeSlash),
                                  color: const Color(0xff6e6e6e),
                                  iconSize: screenHeight * 3.0,
                                  onPressed: () {
                                    setState(() {
                                      _showConfirmPassword = !_showConfirmPassword;
                                    });
                                  },
                                ),

                                labelText: 'Confirmar a nova senha',
                                labelStyle: const TextStyle(color: Color(0xff8e8e8e)),
                                errorStyle: const TextStyle(fontWeight: FontWeight.w700),
                                // hintText: "Data de nascimento do aluno",
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  if (value != _password) {
                                    return 'Senhas não correspondem';
                                  }
                                }

                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 1,
                          ),
                          InfoBox(
                            icon: FontAwesomeIcons.triangleExclamation,
                            content: <Widget>[
                              const AutoSizeText(
                                'Requisitos para sua nova senha!',
                                maxFontSize: 18,
                                minFontSize: 16,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff717171)),
                              ),
                              SizedBox(
                                height: screenHeight * 2,
                              ),
                              CheckLine(
                                screenHeight: screenHeight,
                                text: 'Uma letra maiúscula',
                                checked: upperCaseChar.hasMatch(_password),
                              ),
                              CheckLine(
                                screenHeight: screenHeight,
                                text: 'Uma letra minúscula',
                                checked: lowCaseChar.hasMatch(_password),
                              ),
                              CheckLine(
                                screenHeight: screenHeight,
                                text: 'Um algarismo (número) ou um símbolo (caractere especial)',
                                checked: (numeric.hasMatch(_password) || symbols.hasMatch(_password)),
                              ),
                              CheckLine(
                                screenHeight: screenHeight,
                                text: 'Não pode permitir caracteres acentuados',
                                checked: _password.isNotEmpty &&
                                    !accentUppercase.hasMatch(_password) &&
                                    !accentLowcase.hasMatch(_password),
                              ),
                              CheckLine(
                                screenHeight: screenHeight,
                                text: 'Deve ter no mínimo 8 e no máximo 12 caracteres.',
                                checked: _password.length >= 8 && _password.length <= 12,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 3,
                          ),
                          Observer(
                            builder: (context) {
                              if (_recoverPasswordController.loading) {
                                return const GFLoader(
                                  type: GFLoaderType.square,
                                  loaderColorOne: Color(0xffDE9524),
                                  loaderColorTwo: Color(0xffC65D00),
                                  loaderColorThree: Color(0xffC65D00),
                                  size: GFSize.LARGE,
                                );
                              } else {
                                return EADefaultButton(
                                  text: 'CONFIRMAR ALTERAÇÃO',
                                  icon: FontAwesomeIcons.chevronRight,
                                  iconColor: const Color(0xffffd037),
                                  btnColor: const Color(0xffd06d12),
                                  enabled: (_password.isNotEmpty &&
                                          _confirmPassword.isNotEmpty &&
                                          !spaceNull.hasMatch(_password)) &&
                                      (_confirmPassword == _password),
                                  onPress: () {
                                    _changePassword(_password, widget.token);
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
