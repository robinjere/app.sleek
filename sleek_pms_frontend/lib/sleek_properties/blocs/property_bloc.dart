import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sleek_pms_frontend/sleek_properties/models/property.dart';
import 'package:sleek_pms_frontend/sleek_properties/repositories/property_repository.dart';

// Events
abstract class PropertyEvent extends Equatable {
  const PropertyEvent();
}

class FetchPropertiesEvent extends PropertyEvent {
  final Map<String, dynamic>? filters;

  const FetchPropertiesEvent({this.filters});

  @override
  List<Object?> get props => [filters];
}

class AddPropertyEvent extends PropertyEvent {
  final Property property;

  const AddPropertyEvent(this.property);

  @override
  List<Object> get props => [property];
}

class UpdatePropertyEvent extends PropertyEvent {
  final Property property;

  const UpdatePropertyEvent(this.property);

  @override
  List<Object> get props => [property];
}

class DeletePropertyEvent extends PropertyEvent {
  final int propertyId;

  const DeletePropertyEvent(this.propertyId);

  @override
  List<Object> get props => [propertyId];
}

// States
abstract class PropertyState extends Equatable {
  const PropertyState();
}

class PropertyInitialState extends PropertyState {
  @override
  List<Object> get props => [];
}

class PropertyLoadingState extends PropertyState {
  @override
  List<Object> get props => [];
}

class PropertyLoadedState extends PropertyState {
  final List<Property> properties;
  final bool hasReachedMax;

  const PropertyLoadedState(
      {required this.properties, this.hasReachedMax = false});

  @override
  List<Object> get props => [properties, hasReachedMax];
}

class PropertyErrorState extends PropertyState {
  final String message;

  const PropertyErrorState(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository propertyRepository;

  PropertyBloc({required this.propertyRepository})
      : super(PropertyInitialState()) {
    on<FetchPropertiesEvent>(_onFetchProperties);
    on<AddPropertyEvent>(_onAddProperty);
    on<UpdatePropertyEvent>(_onUpdateProperty);
    on<DeletePropertyEvent>(_onDeleteProperty);
  }

  void _onFetchProperties(
      FetchPropertiesEvent event, Emitter<PropertyState> emit) async {
    try {
      emit(PropertyLoadingState());
      final properties =
          await propertyRepository.fetchProperties(filters: event.filters);
      emit(PropertyLoadedState(properties: properties));
    } catch (e) {
      emit(PropertyErrorState(e.toString()));
    }
  }

  void _onAddProperty(
      AddPropertyEvent event, Emitter<PropertyState> emit) async {
    try {
      await propertyRepository.addProperty(event.property);
      add(const FetchPropertiesEvent());
    } catch (e) {
      emit(PropertyErrorState(e.toString()));
    }
  }

  void _onUpdateProperty(
      UpdatePropertyEvent event, Emitter<PropertyState> emit) async {
    try {
      await propertyRepository.updateProperty(event.property);
      add(const FetchPropertiesEvent());
    } catch (e) {
      emit(PropertyErrorState(e.toString()));
    }
  }

  void _onDeleteProperty(
      DeletePropertyEvent event, Emitter<PropertyState> emit) async {
    try {
      await propertyRepository.deleteProperty(event.propertyId);
      add(const FetchPropertiesEvent());
    } catch (e) {
      emit(PropertyErrorState(e.toString()));
    }
  }
}
