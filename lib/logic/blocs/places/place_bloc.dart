import 'package:firebase_app/logic/blocs/places/place_event.dart';
import 'package:firebase_app/logic/blocs/places/place_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/reposatories/place_repository.dart';


class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlaceRepository repository;

  PlacesBloc(this.repository) : super(PlacesInitial()) {
    on<GetPlacesEvent>(getPlaces);
  }

  Future<void> getPlaces(
    GetPlacesEvent event,

    Emitter<PlacesState> emit,
  ) async {
    emit(PlacesLoading());

    try {
      final places = await repository.getPlaces();

      emit(PlacesSuccess(places));
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
}
