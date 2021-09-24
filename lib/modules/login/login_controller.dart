import 'package:get/get.dart';

import 'package:movies_app/app/ui/loader/loader_mixin.dart';
import 'package:movies_app/app/ui/messages/messages_mixin.dart';
import 'package:movies_app/services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final loading = Rx<bool>(false);
  final message = Rxn<MessageModel>();
  final LoginService _loginService;
  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login realizado com sucesso'));
    } catch (e) {
      loading(false);
      message(
          MessageModel.error(title: 'Erro', message: 'Erro ao realizar login'));
    }
  }
}
