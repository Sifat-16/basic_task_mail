import 'package:basic_task_mail/data/repositories/message_repository_impl.dart';
import 'package:basic_task_mail/domain/repositories/message_repository.dart';
import 'package:get/get.dart';

import '../../domain/model/messages.dart';

class MessageController extends GetxController{

  MessageRepository messageRepository = MessageRepositoryImpl();
  List<Messages> messages = [];
  getMessages(){
    messageRepository.getMessages().then((value) {
      messages = value;
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getMessages();
    super.onInit();
  }

}