part of 'dog_bloc.dart';

@immutable
abstract class DogEvent {

}

class SetBreedsEvent extends DogEvent{
  final List<String> listBreeds;

  SetBreedsEvent(this.listBreeds);
}
