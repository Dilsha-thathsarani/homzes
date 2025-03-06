import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/models/property_model.dart';
import 'package:homzes/data/repositories/property_repository.dart';

import 'package:equatable/equatable.dart';

// Events
abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class FetchProperties extends PropertyEvent {}

// States
abstract class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> properties;

  const PropertyLoaded(this.properties);

  @override
  List<Object> get props => [properties];
}

class PropertyError extends PropertyState {
  final String message;

  const PropertyError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository propertyRepository;

  PropertyBloc({required this.propertyRepository}) : super(PropertyInitial()) {
    on<FetchProperties>(_onFetchProperties);
  }

  void _onFetchProperties(
      FetchProperties event, Emitter<PropertyState> emit) async {
    emit(PropertyLoading());
    try {
      final properties = await propertyRepository.getProperties();
      emit(PropertyLoaded(properties));
    } catch (e) {
      emit(PropertyError('Failed to fetch properties'));
    }
  }
}
