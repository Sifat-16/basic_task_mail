import 'package:basic_task_mail/presentation/controllers/sign_in_controller.dart';
import 'package:basic_task_mail/utils/routes/route_names.dart';
import 'package:basic_task_mail/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Page"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [

                    TextField(

                      onChanged: (s){
                        controller.changeAddress(s);
                      },

                      decoration: InputDecoration(
                          hintText: 'Email',

                          border: OutlineInputBorder(

                          )
                      ),
                    ),
                    TextField(

                      onChanged: (s){
                        controller.changePass(s);
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(

                          )
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      controller.login();
                    }, child: Text("login")),
                    SizedBox(height: 30,),
                    TextButton(onPressed: (){
                      Get.toNamed(RouteNames.login);

                    }, child: Text("Go to Sign Up Page"))

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
