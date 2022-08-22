import 'dart:convert';

import 'package:dogs_app_flutter/responses/all_breeds_response.dart';
import 'package:http/http.dart' as http;



class DogsRespository {

    Future<List<String>> getAllBreeds() async {
    

    final response = await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"),
       headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final allDogsBreedResponse = allDogsBreedResponseFromJson(response.body);

      List<String> breeds = [];

      allDogsBreedResponse.message.keys.forEach(( breed ) {
        breeds.add(breed);
      });

      return breeds;
    } else {
      return [];
    }
  }
}