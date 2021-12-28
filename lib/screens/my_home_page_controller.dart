import 'package:get/get.dart';
import 'package:task/apis/api_provider.dart';
import 'package:task/modal/request.dart';
import 'package:task/modal/response.dart';
import 'package:flutter/material.dart';

class MyHomePageController extends GetxController{

  final ApiProvider _apiProvider = Get.find();
  RxList<Result> countryList = RxList<Result>([]);
  RxList<Result> stateList = RxList<Result>([]);
  RxList<Result> cityList = RxList<Result>([]);

  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();


  @override
  void onReady() {
    getCountryList();
    super.onReady();
  }

  getCountryList(){
   _apiProvider.getCountryList().then((ApiResponse? value) {
     if(value != null){
       countryList.addAll(value.result);
     }
   });
 }

  getStateList(StateRequest request){
    _apiProvider.getStateList(request).then((ApiResponse? value) {
      if(value != null){
        stateList.addAll(value.result);
      }
    });
  }

  getCityList(CityRequest request){
    _apiProvider.getCityList(request).then((ApiResponse? value) {
      if(value != null){
        cityList.addAll(value.result);
      }
    });
  }
  
  filterCountryList(String pattern){
    List<Result> match = [];
    for(Result item in countryList){
      if(item.countryName != null){
        if(item.countryName!.toLowerCase().contains(pattern.toLowerCase())){
          match.add(item);
        }
      }
    }
    return match;
  }

  filterStateList(String pattern){
    List<Result> match = [];
    for(Result item in stateList){
      if(item.name != null){
        if(item.name!.toLowerCase().contains(pattern.toLowerCase())){
          match.add(item);
        }
      }
    }
    return match;
  }

  filterCityList(String pattern){
    List<Result> match = [];
    for(Result item in cityList){
      if(item.name != null){
        if(item.name!.toLowerCase().contains(pattern.toLowerCase())){
          match.add(item);
        }
      }
    }
    return match;
  }
}