import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchCubit extends Cubit<ClinicState> {
  final Search _search;
  SearchCubit(this._search) : super(ClinicInitial());

  Future<void> searchClinic(
    String query,
  ) async {
    emit(GetSearchLoading());
    final result = await _search(query);
    result.fold((failure) {
      emit(GetSearchError(failure.message.toString()));
    }, (clinics) {
      emit(GetSearchSuccess(clinics));
    });
  }

  void clearSearchRewsults() {
    emit(ClinicInitial());
  }
}
