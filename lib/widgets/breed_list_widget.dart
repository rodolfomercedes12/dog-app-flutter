import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/dog/dog_bloc.dart';

class BreedList extends StatelessWidget {
  const BreedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text("Breed List",
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold)),
                 const SizedBox(height: 10.0,),
          Expanded(
            child: Container(
              child: BlocBuilder<DogBloc, DogState>(
                builder: (context, state) {
                  return state.listBreeds.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.listBreeds.length,
                          itemBuilder: (context, index) {
                            final String breed = state.listBreeds[index];

                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    //TODO: CREAR EVENTO PARA CAMBIAR LA RAZA SELECCIONADA
                                    Navigator.pop(context);
                                  },
                                  leading: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.pets,
                                        color: Colors.white, size: 20.0),
                                  ),
                                  title: Text(
                                    breed.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[900]),
                                  ),
                                ),
                                Divider(color: Colors.grey,)
                              ],
                            );
                          });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
