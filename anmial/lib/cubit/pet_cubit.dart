
import 'package:anmial/cubit/pet_state.dart';
import 'package:anmial/enum/enums.dart';
import 'package:anmial/repo/pet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetCubit extends Cubit<PetState> {
  final PetRepository _repository;

  PetCubit(this._repository) : super(PetInitial());

  Future<void> fetchRandomPet(PetType petType) async {
    emit(PetLoading());
    
    try {
      final imageUrl = await _repository.fetchRandomPetImage(petType);
      final petTypeString = _getPetTypeString(petType);
      
      emit(PetLoaded(
        imageUrl: imageUrl,
        petType: petTypeString,
      ));
    } catch (e) {
      emit(PetError(e.toString()));
    }
  }

  String _getPetTypeString(PetType petType) {
    switch (petType) {
      case PetType.dog:
        return 'Dog';
      case PetType.catImage:
        return 'Cat Image';
      case PetType.catGif:
        return 'Cat GIF';
    }
  }
}
