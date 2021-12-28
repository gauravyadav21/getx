import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:task/apis/api_name.dart';
import 'package:task/modal/request.dart';
import 'package:task/modal/response.dart';

class ApiProvider extends GetConnect{


  @override
  void onInit() {
    httpClient.baseUrl = ApiName.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 5);
    var headers = {'Api-Token': ApiName.apiKey};
    httpClient.addRequestModifier<dynamic>((request) async{
      request.headers.addAll(headers);
      return request;
    });
    httpClient.addResponseModifier((request, response) {
      return response;
    });
    super.onInit();
  }

   Future<ApiResponse?> getCountryList() async{
    try{
      final response = await post(ApiName.countryList,null);
      return ApiResponse.fromJson(json.decode(response.body));
    }catch(e){
      log(e.toString());
    }
  }

  Future<ApiResponse?> getStateList(StateRequest request) async{
    try{
      final response = await post(ApiName.stateList,request.toJson());
      return ApiResponse.fromJson(json.decode(response.body));
    }catch(e){
      log(e.toString());
    }
  }

  Future<ApiResponse?> getCityList(CityRequest request) async{
    try{
      final response = await post(ApiName.cityList,request.toJson());
      return ApiResponse.fromJson(json.decode(response.body));
    }catch(e){
      log(e.toString());
    }
  }
  
}