// To parse this JSON data, do
//
//     final randomImagesResponse = randomImagesResponseFromJson(jsonString);

import 'dart:convert';

RandomImagesResponse randomImagesResponseFromJson(String str) => RandomImagesResponse.fromJson(json.decode(str));

String randomImagesResponseToJson(RandomImagesResponse data) => json.encode(data.toJson());

class RandomImagesResponse {
    RandomImagesResponse({
       required this.randomImages,
       required this.status,
    });

    List<String> randomImages;
    String status;

    factory RandomImagesResponse.fromJson(Map<String, dynamic> json) => RandomImagesResponse(
        randomImages: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(randomImages.map((x) => x)),
        "status": status,
    };
}
