part of 'details_cubit.dart';

@immutable
abstract class DetailsState {
  HomeDetails? get fetchedDetails => null;
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  @override
  final HomeDetails fetchedDetails;
  DetailsSuccess(this.fetchedDetails);
  get detail => fetchedDetails;
}

class DetailsFailure extends DetailsState {}
