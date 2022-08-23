part of 'dog_bloc.dart';

class DogState extends Equatable{

final List<String> listBreeds;
final List<String> listSubBreeds;
final List<String> imagesDogs;
final String selectedBreed;

const DogState({
  this.selectedBreed = "Select a Dog Breed",
  this.listBreeds = const [],
  this.listSubBreeds = const [],
  this.imagesDogs = const []
});

DogState copyWith({
  List<String>? listBreeds,
  List<String>? listSubBreeds,
  List<String>? imagesDogs,
  String? selectedBreed,

}) => DogState(
  listBreeds: listBreeds ?? this.listBreeds,
  listSubBreeds: listSubBreeds ?? this.listSubBreeds,
  imagesDogs: imagesDogs ?? this.imagesDogs,
  selectedBreed: selectedBreed ?? this.selectedBreed
);

  @override
  
  List<Object?> get props => [ listBreeds, listSubBreeds,  imagesDogs, selectedBreed  ];

}