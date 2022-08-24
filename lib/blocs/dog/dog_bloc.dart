import 'package:bloc/bloc.dart';
import 'package:dogs_app_flutter/repository/dogs_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {

  final DogsRespository dogsRespository;

  DogBloc({ required this.dogsRespository }) : super(const DogState()) {
    on<SetBreedsEvent>((event, emit) {
     emit(state.copyWith( listBreeds: event.listBreeds ));
    });

    on<SetRandomImagesEvent>((event, emit) {
     emit(state.copyWith( imagesDogs: event.randomImages ));
    });

    on<BreedSelectedEvent>((event, emit) async {
      final randomImages = await dogsRespository.getRandomImagesOfDogsByBreed( event.breedSelected );
      emit( state.copyWith( selectedBreed: event.breedSelected, imagesDogs: randomImages ) );
    });

    loadData();
  }

  


   loadData() async {
    //final listBreeds = await dogsRespository.getAllBreeds();
    //final randomImages = await dogsRespository.getRandomImagesOfDogs();

     final response = await Future.wait([
      dogsRespository.getAllBreeds(),
      dogsRespository.getRandomImagesOfDogs()
    ]);
    add( SetBreedsEvent( response[0] ) );
    add( SetRandomImagesEvent(response[1]) );
  }

}
