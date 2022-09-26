import 'package:bloc/bloc.dart';
import 'package:git_users/modules/user_details/domain/usecases/get_user_details_usecase.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_event.dart';
import 'package:git_users/modules/user_details/presenters/screens/user_details/bloc/user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final IGetUserDetailsUseCase useCase;
  UserDetailsBloc({required this.useCase})
      : super(UserDetailScreenLoadingState()) {
    on<FetchUserDetailsEvent>((event, emit) async =>
        await _loadUserDetails(userName: event.userName, emit: emit));
  }

  Future<void> _loadUserDetails(
      {required String userName,
      required Emitter<UserDetailsState> emit}) async {
    emit(UserDetailScreenLoadingState());
    final res = await useCase.getUserDetails(userName: userName);
    if (res.isSuccess) {
      emit(UserDetailsScreenLoadedState(userDetails: res.value!));
    } else {
      emit(UserDetailScreenErrorState());
    }
  }
}
