
import 'package:basic_task_mail/data/datasource/local/shared_preference_manager.dart';
import 'package:basic_task_mail/data/repositories/auth_repository_impl.dart';
import 'package:basic_task_mail/data/repositories/domain_repository_impl.dart';
import 'package:basic_task_mail/domain/model/domains.dart';
import 'package:basic_task_mail/domain/repositories/auth_repository.dart';
import 'package:basic_task_mail/domain/repositories/domain_repository.dart';
import 'package:basic_task_mail/utils/routes/route_names.dart';
import 'package:get/get.dart';

import '../../dependency_injection/di.dart';

class SignupController extends GetxController{

  DomainRepository domainRepository = DomainRepositoryImpl();
  AuthRepository authRepository = AuthRepositoryImpl();

  List<Domains> domains = [];
  int? selectedDomainIndex;
  String address="";
  String password="";

  getDomains(){
    domainRepository.generateDomain().then((value) {
      domains = value;
      update();
    });
  }

  selectDomain(int index){
      selectedDomainIndex = index;
      update();
  }

  createAccount(){
    authRepository.createAccount("$address@${domains[selectedDomainIndex!].domain}", password).then((value) {
      Get.toNamed(RouteNames.login);
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