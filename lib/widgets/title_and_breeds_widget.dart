import 'package:dogs_app_flutter/widgets/breed_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/dog/dog_bloc.dart';

class TitleAndBreedList extends StatelessWidget {
  const TitleAndBreedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Dogs App",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<DogBloc, DogState>(
              builder: (context, state) {
                return Text(
                  state.selectedBreed.toUpperCase(),
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                showBreedList(context);
              },
              child: const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.black,
                child: Icon(Icons.pets, color: Colors.white, size: 20.0),
              ),
            ),
            //Spacer()
          ],
        ),
      ],
    );
  }

  Future<dynamic> showBreedList(BuildContext context) {
    return showModalBottomSheet(
      shape:const  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const BreedList();
      },
    );
  }
}
