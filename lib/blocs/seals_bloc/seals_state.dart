part of 'seals_bloc.dart';

abstract class SealsState extends Equatable {
  const SealsState();

  @override
  List<Object?> get props => [];
}

class SealsInitial extends SealsState {}

class SealsLoading extends SealsState {}

class SealsLoaded extends SealsState {
  final Objects sealsModel;
  const SealsLoaded(this.sealsModel);
}

class SealsError extends SealsState {
  final String? message;
  const SealsError(this.message);
}
