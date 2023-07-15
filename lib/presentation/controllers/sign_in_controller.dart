import 'package:basic_task_mail/utils/routes/route_names.dart';
import 'package:get/get.dart';

import '../../data/datasource/local/shared_preference_manager.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../dependency_injection/di.dart';
import '../../domain/repositories/auth_repository.dart';

class SignInController extends GetxController{

  AuthRepository authRepository = AuthRepositoryImpl();
  SharedPreferenceManager sharedPreferenceManager = sl.get<SharedPreferenceManager>();

  String address="";
  String password="";




  login(){
    authRepository.login(address, password).then((value) async{

      await sharedPreferenceManager.setAccessToken(value.token!);
      Get.toNamed(RouteNames.message);

    });
  }

  void changeAddress(String s) {
    address = s;
    update();
  }

  void changePass(String s) {
    password = s;
    update();
  }
}