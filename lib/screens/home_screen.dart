import 'package:flutter/material.dart';
import 'package:dogs_app_flutter/widgets/dog_list_gallery_widget.dart';
import '../widgets/title_and_breeds_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
          body:  Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child:   Column(
          children: const [
              TitleAndBreedList(),
             SizedBox(
              height: 30.0,
            ),
            DogList()
          ],
        ),
      )),
    );
  }
}
