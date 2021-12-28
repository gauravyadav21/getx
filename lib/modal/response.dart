import 'package:json_annotation/json_annotation.dart';

class ApiResponse {
  Error? error;
  List<Result> result = [];

  ApiResponse({this.error, required this.result});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    error = json['Error'] != null ? Error.fromJson(json['Error']) : null;
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['Error'] = error?.toJson();
    }
    data['Result'] = result.map((v) => v.toJson()).toList();
    return data;
  }
}

class Error {
  String? errorCode;
  String? errorMessage;

  Error({errorCode, errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ErrorCode'] = errorCode;
    data['ErrorMessage'] = errorMessage;
    return data;
  }
}

class Result {
  int? countryID;
  String? countryCode;
  String? countryName;
  @JsonKey(name: 'ID')
  int? id;
  @JsonKey(name: 'Name')
  String? name;

  Result({this.countryID, this.countryCode, this.countryName, this.id, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
    countryCode = json['CountryCode'];
    countryName = json['CountryName'];
    id = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CountryID'] = countryID;
    data['CountryCode'] = countryCode;
    data['CountryName'] = countryName;
    data['ID'] = id;
    data['Name'] = name;
    return data;
  }
}
