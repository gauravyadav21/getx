import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:task/modal/request.dart';
import 'package:task/modal/response.dart';
import 'package:task/screens/my_home_page_controller.dart';

class MyHomePage extends GetView<MyHomePageController>{
  const MyHomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller.countryController,
                  decoration: const InputDecoration(
                    labelText: "Country",
                  )
              ),
                suggestionsCallback: (pattern) async{
                  return controller.filterCountryList(pattern);
                },
                itemBuilder: (context, suggestion){
                  suggestion as Result;
                  return Padding(padding: const EdgeInsets.all(5),child: Text(suggestion.countryName.toString()));
                },
                onSuggestionSelected: (sug){
                sug as Result?;
                StateRequest request = StateRequest();
                request.countryID = sug?.countryID;
                controller.getStateList(request);
                  controller.countryController.text = sug?.countryName ?? "";
                }
            ),
            const SizedBox(height: 5,),
            TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: controller.stateController,
                    decoration: const InputDecoration(
                      labelText: "State",
                    )
                ),
                suggestionsCallback: (pattern) async{
                  return controller.filterStateList(pattern);
                },
                itemBuilder: (context, suggestion){
                  suggestion as Result;
                  return Padding(padding: const EdgeInsets.all(5),child: Text(suggestion.name.toString()));
                },
                onSuggestionSelected: (sug){
                  sug as Result?;
                  CityRequest request = CityRequest();
                  request.stateID = sug?.id;
                  controller.getCityList(request);
                  controller.stateController.text = sug?.name ?? "";
                }
            ),
            const SizedBox(height: 5,),
            TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: controller.cityController,
                    decoration: const InputDecoration(
                      labelText: "City",
                    )
                ),
                suggestionsCallback: (pattern) async{
                  return controller.filterCityList(pattern);
                },
                itemBuilder: (context, suggestion){
                  suggestion as Result;
                  return Padding(padding: const EdgeInsets.all(5),child: Text(suggestion.name.toString()));
                },
                onSuggestionSelected: (sug){
                  sug as Result?;
                  controller.cityController.text = sug?.name ?? "";
                }
            )
          ],
        ),
      ),
    );
  }

}