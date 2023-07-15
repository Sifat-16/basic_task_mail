import 'package:basic_task_mail/domain/model/messages.dart';
import 'package:basic_task_mail/domain/repositories/message_repository.dart';

import '../../dependency_injection/di.dart';
import '../../domain/model/domains.dart';
import '../../utils/res/Api/api_client.dart';
import '../../utils/res/endpoints.dart';
import '../datasource/remote/service/network_api_service.dart';

class MessageRepositoryImpl extends MessageRepository{
  ApiService apiService = sl.get<ApiService>();
  ApiClient apiClient = sl.get<ApiClient>();
  EndPoints endPoints = sl.get<EndPoints>();
  @override
  Future<List<Messages>> getMessages() async{
    try{
      List<Messages> messages = [];
      dynamic responseData = await apiService.getApiResponse("${apiClient.rootUrl}/${endPoints.messages}", token: true);
      Iterable allMessages = responseData;
      for (var element in allMessages) {

        messages.add(Messages.fromJson(element));

      }
      return messages;
    }catch(e){
      throw e;
    }
  }

}