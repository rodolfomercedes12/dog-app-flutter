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
    loadData();
  }

  


   loadData() async {
    final listBreeds = await dogsRespository.getAllBreeds();
    add( SetBreedsEvent( listBreeds ) );
  }

}
