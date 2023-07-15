import 'package:basic_task_mail/domain/model/domains.dart';
import 'package:basic_task_mail/domain/repositories/domain_repository.dart';

import '../../dependency_injection/di.dart';
import '../../utils/res/Api/api_client.dart';
import '../../utils/res/endpoints.dart';
import '../datasource/remote/service/network_api_service.dart';

class DomainRepositoryImpl extends DomainRepository{
  ApiService apiService = sl.get<ApiService>();
  ApiClient apiClient = sl.get<ApiClient>();
  EndPoints endPoints = sl.get<EndPoints>();
  @override
  Future<List<Domains>> generateDomain() async{


    try{
      List<Domains> domains = [];
      dynamic responseData = await apiService.getApiResponse(apiClient.rootUrl+"/${endPoints.domains}");
      Iterable allDomains = responseData;
      for (var sdomains in allDomains) {

        domains.add(Domains.fromJson(sdomains));

      }
      return domains;
    }catch(e){
      throw e;
    }

  }

}