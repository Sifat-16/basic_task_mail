import 'dart:convert';
import 'dart:io';
import 'package:basic_task_mail/data/datasource/local/shared_preference_manager.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../../dependency_injection/di.dart';
import '../../../../utils/res/Api/api_client.dart';
import '../exceptions/api_exceptions.dart';
import 'base_api_service.dart';


class ApiService extends BaseApiService{

  ApiClient apiClient = sl.get<ApiClient>();
  SharedPreferenceManager sharedPreferenceManager = sl.get<SharedPreferenceManager>();

  @override
  Future getApiResponse(String url, {bool? token}) async{
    dynamic responseJson;
    try{
      /*final response = await apiClient.httpClient.get(url);
      responseJson = returnResponse(response);*/
      dynamic headers = token==null?{
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      }:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':"Bearer ${sharedPreferenceManager.getAccessToken()}"
      };
      final response = await get(Uri.parse(url), headers: headers);
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions(message: 'No Internet Connection');
    }
    catch(e){
      print(e);
      throw FetchDataExceptions(message: 'Error During Communication');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async{

    dynamic responseJson;


    try{
      final response = await post(Uri.parse(url), body: data, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json'
      }).timeout(const Duration(seconds: 30));
      print(response.body);
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions(message: 'No Internet Connection');
    }
    on FormatException{
      throw FetchDataExceptions(message: 'Format Exception');
    }
    catch(e){
      print(e);
      throw e;
    }
    return responseJson;
  }

  @override
  Future postWithFiles(String url, dynamic data, Map<String,File> files) async {
    dynamic responseJson;
    try {
      var request = MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(data);

      files.forEach((key, value) async{
        String fieldName = key; // Modify this according to your API's expected file field name
        String fileName = value.path.split('/').last;
        String mimeType = lookupMimeType(value.path)??"";


        var fileStream = ByteStream(Stream.castFrom(value.openRead()));
        var fileLength = await value.length();

        var multipartFile = MultipartFile(
          fieldName,
          fileStream,
          fileLength,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        );

        request.files.add(multipartFile);
      });



      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var statusCode = response.statusCode;

      responseJson = returnResponse(Response(responseBody, statusCode));
    } on SocketException {
      throw FetchDataExceptions(message: 'No Internet Connection');
    } catch (e) {
      throw FetchDataExceptions(message: 'Error During Communication');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataExceptions(message: "Error during connection");
    }
  }
  
}