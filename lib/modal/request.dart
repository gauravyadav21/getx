import 'package:json_annotation/json_annotation.dart';

class StateRequest {
  @JsonKey(name: 'CountryID')
  int? countryID;

  StateRequest({this.countryID});

  StateRequest.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CountryID'] = countryID;
    return data;
  }
}

class CityRequest {

  @JsonKey(name: 'StateID')
  int? stateID;

  CityRequest({this.stateID});

  CityRequest.fromJson(Map<String, dynamic> json) {
    stateID = json['StateID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StateID'] = stateID;
    return data;
  }
}