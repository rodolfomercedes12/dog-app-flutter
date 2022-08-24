part of 'dog_bloc.dart';

@immutable
abstract class DogEvent {

}

class SetBreedsEvent extends DogEvent{
  final List<String> listBreeds;

  SetBreedsEvent(this.listBreeds);
}


class SetRandomImagesEvent extends DogEvent{
  final List<String> randomImages;

  SetRandomImagesEvent(this.randomImages);
}


class BreedSelectedEvent extends DogEvent{
  final String breedSelected;

  BreedSelectedEvent(this.breedSelected);
}
