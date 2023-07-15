import 'package:basic_task_mail/domain/model/messages.dart';
import 'package:basic_task_mail/presentation/controllers/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
        init: MessageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Messages Page"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [

                    controller.messages.isEmpty?Text("No Message to show"):

                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index){

                          Messages message = controller.messages[index];
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("From: ${message.from!.address}"),
                                Text("To: ${message.to!.first.address}"),
                              ],
                            ),
                            subtitle: Text("Message: ${message.intro}"),
                          );

                        }),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
