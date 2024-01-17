part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  int get isSelected => 0;
  List<HomeData> get fetchedHomes => [];
  List<HomeData> get filterHomes => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  @override
  final List<HomeData> fetchedHomes;
  HomeSuccess(this.fetchedHomes);
  get listHome => fetchedHomes;
}

class HomeFailure extends HomeState {}

class HomeCategorySelected extends HomeState {
  final int isSelected;
  final List<HomeData> filterHomes;
  HomeCategorySelected(this.isSelected, this.filterHomes);
}

class HomeIsFavorite extends HomeState {
  final int isSelected;
  final List<HomeData> filterHomes;
  final List<HomeData> fetchedHomes;
  HomeIsFavorite(this.isSelected, this.filterHomes, this.fetchedHomes);
}
