import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/get_subjects_usecase.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetSubjectsUseCase getSubjectsUseCase;

  HomeCubit(this.getSubjectsUseCase) : super(HomeInitial());

  Future<void> fetchSubjects() async {
    emit(HomeLoading());

    final result = await getSubjectsUseCase.call();

    result.when(
      success: (subjects) => emit(HomeLoaded(subjects)),
      failure: (error) => emit(HomeError(error as String)),
    );
  }
}
