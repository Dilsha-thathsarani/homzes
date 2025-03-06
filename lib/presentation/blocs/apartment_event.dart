abstract class ApartmentEvent {}

class LoadApartments extends ApartmentEvent {}

class SearchApartments extends ApartmentEvent {
  final String query;

  SearchApartments(this.query);
}
