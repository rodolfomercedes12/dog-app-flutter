

import 'package:dogs_app_flutter/constants/constants.dart';
import 'package:dogs_app_flutter/responses/all_breeds_response.dart';
import 'package:dogs_app_flutter/responses/random_images_all_breeds.dart';
import 'package:http/http.dart' as http;



class DogsRespository {

    Future<List<String>> getAllBreeds() async {
    

    final response = await http.get(Uri.parse(allBreedsUrl),
       headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final allDogsBreedResponse = allDogsBreedResponseFromJson(response.body);

      List<String> breeds = [];

      allDogsBreedResponse.listBreeds.keys.forEach(( breed ) {
        breeds.add(breed);
      });

      return breeds;
    } else {
      return [];
    }
  }




   Future<List<String>> getRandomImagesOfDogs() async {

    final response = await http.get(Uri.parse(randomImagesUrl),
       headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final randomImagesResponse = randomImagesResponseFromJson(response.body);

      List<String> imagesOfDogs = [];

      randomImagesResponse.randomImages.forEach(( image ) {
        imagesOfDogs.add(image);
      });

      return imagesOfDogs;
    } else {
      return [];
    }
  }





   Future<List<String>> getRandomImagesOfDogsByBreed( String breed ) async {

    final response = await http.get(Uri.parse("https://dog.ceo/api/breed/$breed/images/random/35"),
       headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final randomImagesResponse = randomImagesResponseFromJson(response.body);

      List<String> imagesOfDogs = [];

      randomImagesResponse.randomImages.forEach(( image ) {
        imagesOfDogs.add(image);
      });

      return imagesOfDogs;
    } else {
      return [];
    }
  }

  
}