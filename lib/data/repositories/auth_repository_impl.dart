import 'dart:convert';

import 'package:basic_task_mail/data/datasource/local/shared_preference_manager.dart';
import 'package:basic_task_mail/data/datasource/remote/exceptions/api_exceptions.dart';
import 'package:basic_task_mail/domain/model/Account.dart';
import 'package:basic_task_mail/domain/model/token.dart';
import 'package:basic_task_mail/domain/repositories/auth_repository.dart';

import '../../dependency_injection/di.dart';
import '../../utils/res/Api/api_client.dart';
import '../../utils/res/endpoints.dart';
import '../datasource/remote/service/network_api_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  ApiService apiService = sl.get<ApiService>();
  ApiClient apiClient = sl.get<ApiClient>();
  EndPoints endPoints = sl.get<EndPoints>();

  @override
  Future<Account> createAccount(String address, String password) async{

    try{
      dynamic responseData = await apiService.postApiResponse("${apiClient.rootUrl}/${endPoints.createAccount}", jsonEncode(<String, dynamic>{"address":address, "password":password}));

      Account account = Account.fromJson(responseData);

      return account;
    }on FormatException{
      throw FetchDataExceptions(message: 'Format Exception');

    }
    catch(e){
      print(e);
      throw e;
    }

  }

  @override
  Future<Token> login(String address, String password) async{
    try{
      dynamic responseData = await apiService.postApiResponse("${apiClient.rootUrl}/${endPoints.token}", jsonEncode(<String, dynamic>{"address":address, "password":password}));
      Token token = Token.fromJson(responseData);
      return token;
    }catch(e){
      throw e;
    }
  }


}