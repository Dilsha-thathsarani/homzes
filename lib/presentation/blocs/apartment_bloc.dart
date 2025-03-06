import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/repositories/apartment_repository.dart';
import 'package:homzes/presentation/blocs/apartment_event.dart';
import 'package:homzes/presentation/blocs/apartment_state.dart';

class ApartmentBloc extends Bloc<ApartmentEvent, ApartmentState> {
  final ApartmentRepository _apartmentRepository;
  StreamSubscription? _apartmentSubscription;

  ApartmentBloc({required ApartmentRepository apartmentRepository})
      : _apartmentRepository = apartmentRepository,
        super(ApartmentInitial()) {
    on<LoadApartments>(_onLoadApartments);
    on<SearchApartments>(_onSearchApartments);
  }

  void _onLoadApartments(LoadApartments event, Emitter<ApartmentState> emit) {
    emit(ApartmentLoading());
    try {
      _apartmentSubscription?.cancel();
      _apartmentSubscription = _apartmentRepository.getApartments().listen(
        (apartments) {
          if (!emit.isDone) emit(ApartmentLoaded(apartments));
        },
        onError: (error) {
          if (!emit.isDone) emit(ApartmentError(error.toString()));
        },
      );
    } catch (e) {
      if (!emit.isDone) emit(ApartmentError(e.toString()));
    }
  }

  void _onSearchApartments(
      SearchApartments event, Emitter<ApartmentState> emit) {
    emit(ApartmentLoading());
    try {
      _apartmentSubscription?.cancel();

      final stream = event.query.isEmpty
          ? _apartmentRepository.getApartments()
          : _apartmentRepository.searchApartments(event.query);

      _apartmentSubscription = stream.listen(
        (apartments) {
          if (!emit.isDone) emit(ApartmentLoaded(apartments));
        },
        onError: (error) {
          if (!emit.isDone) emit(ApartmentError(error.toString()));
        },
      );
    } catch (e) {
      if (!emit.isDone) emit(ApartmentError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _apartmentSubscription?.cancel();
    return super.close();
  }
}
