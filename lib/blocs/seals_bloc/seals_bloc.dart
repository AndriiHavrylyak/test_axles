import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_axles/models/seals_model.dart';
import 'package:test_axles/resources/api_repository.dart';

part 'seals_event.dart';
part 'seals_state.dart';

class SealsBloc extends Bloc<SealsEvent, SealsState> {
  SealsBloc() : super(SealsInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetSealsList>((event, emit) async {
      try {
        emit(SealsLoading());
        final mList = await _apiRepository.fetchSealsList();
        emit(SealsLoaded(mList));
        if (mList.error != null) {
          emit(SealsError(mList.error));
        }
      } on NetworkError {
        emit(SealsError("Помилка при завантажені даних. Ваш сервер  в онлайні??"));
      }
    });
  }
}
