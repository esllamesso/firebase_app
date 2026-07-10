import 'package:firebase_app/core/reposatories/place_repository.dart';
import 'package:firebase_app/logic/blocs/places/place_event.dart';
import 'package:firebase_app/logic/blocs/places/place_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlacesStates>{
  final PlaceRepository repository;
  PlaceBloc(this.repository) : super(PlacesInitial()) {
    on<GetPlacesEvent>(getPlaces);
  }

  Future<void> getPlaces(
      GetPlacesEvent event,
      Emitter<PlacesStates> emit,
      ) async {
    emit(PlacesLoading());

    try{
      final places = await repository.getPlaces();
      emit(PlacesSuccess(places));
    }catch(e){

      emit(PlacesError(e.toString()));
    }
  }
}