import 'package:dogs_app_flutter/blocs/dog/dog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,

      ),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          return state.listBreeds.isEmpty ? const  Center(
            child:  CircularProgressIndicator(),
          ) :  ListView.builder(
            itemCount: state.listBreeds.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(state.listBreeds[index]),
              );
          });
        },
      )
    );
  }
}