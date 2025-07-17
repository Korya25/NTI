

abstract class PetState  {
  const PetState();

}

class PetInitial extends PetState {}

class PetLoading extends PetState {}

class PetLoaded extends PetState {
  final String imageUrl;
  final String petType;

  const PetLoaded({
    required this.imageUrl,
    required this.petType,
  });


}

class PetError extends PetState {
  final String message;

  const PetError(this.message);

}

