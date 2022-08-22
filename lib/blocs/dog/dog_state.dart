part of 'dog_bloc.dart';

class DogState extends Equatable{

final List<String> listBreeds;
final List<String> listSubBreeds;
final List<String> imagesDogs;

const DogState({
  this.listBreeds = const [],
  this.listSubBreeds = const [],
  this.imagesDogs = const []
});

DogState copyWith({
  List<String>? listBreeds,
  List<String>? listSubBreeds,
  List<String>? imagesDogs

}) => DogState(
  listBreeds: listBreeds ?? this.listBreeds,
  listSubBreeds: listSubBreeds ?? this.listSubBreeds,
  imagesDogs: imagesDogs ?? this.imagesDogs
);

  @override
  
  List<Object?> get props => [ listBreeds, listSubBreeds,  imagesDogs  ];

}