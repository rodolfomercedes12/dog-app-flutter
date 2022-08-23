// To parse this JSON data, do
//
//     final allDogsBreedResponse = allDogsBreedResponseFromJson(jsonString);

import 'dart:convert';

AllDogsBreedResponse allDogsBreedResponseFromJson(String str) => AllDogsBreedResponse.fromJson(json.decode(str));

String allDogsBreedResponseToJson(AllDogsBreedResponse data) => json.encode(data.toJson());

class AllDogsBreedResponse {
    AllDogsBreedResponse({
       required  this.listBreeds,
        required this.status,
    });

    Map<String, List<String>>  listBreeds;
    String status;

    factory AllDogsBreedResponse.fromJson(Map<String, dynamic> json) => AllDogsBreedResponse(
        listBreeds: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": Map.from(listBreeds).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
    };
}
