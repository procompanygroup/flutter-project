part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  Personal? get fetchedPerson => null;
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  @override
  final Personal fetchedPerson;
  ProfileSuccess(this.fetchedPerson);
  get person => fetchedPerson;
}

class ProfileFailure extends ProfileState {}
