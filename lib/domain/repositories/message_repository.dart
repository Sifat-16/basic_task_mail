import 'package:basic_task_mail/domain/model/messages.dart';

abstract class MessageRepository{
  Future<List<Messages>>getMessages();
}