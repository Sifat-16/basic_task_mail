import 'package:basic_task_mail/domain/model/Account.dart';
import 'package:basic_task_mail/domain/model/token.dart';

abstract class AuthRepository{
  Future<Account>createAccount(String address, String password);
  Future<Token> login(String address, String password);
}