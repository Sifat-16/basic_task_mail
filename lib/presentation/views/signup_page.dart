import 'package:basic_task_mail/domain/model/domains.dart';
import 'package:basic_task_mail/presentation/controllers/signup_controller.dart';
import 'package:basic_task_mail/utils/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Registration Page"),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        controller.getDomains();
                      }, child: Text("Generate Domain")),
                      SizedBox(width: 10,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.domains.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index)
                            {
                              Domains domains = controller.domains[index];
                              return ListTile(
                                leading: IconButton(onPressed: (){
                                  controller.selectDomain(index);
                                }, icon: controller.selectedDomainIndex==null||controller.selectedDomainIndex!=index? Icon(Icons.check_box_outline_blank):Icon(Icons.check_box)),


                                title: Text("${domains.domain}"),

                              );

                        }),
                      )

                    ],
                  ),
                  TextField(

                    onChanged: (s){
                      controller.changeAddress(s);
                    },

                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffix: controller.selectedDomainIndex==null?Text(""): Text("@${controller.domains[controller.selectedDomainIndex!].domain}", style: TextStyle(
                        color: Colors.grey
                      ),),
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
                    controller.createAccount();
                  }, child: Text("Create")),
                  SizedBox(height: 30,),
                  TextButton(onPressed: (){
                    Get.toNamed(RouteNames.login);
                  }, child: Text("Go to login page"))

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
