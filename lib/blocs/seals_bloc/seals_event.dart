part of 'seals_bloc.dart';

abstract class SealsEvent extends Equatable {
  const SealsEvent();

  @override
  List<Object> get props => [];
}

class GetSealsList extends SealsEvent {}
