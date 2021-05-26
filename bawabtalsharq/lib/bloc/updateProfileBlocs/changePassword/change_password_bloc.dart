import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_event.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_state.dart';
import 'package:bawabtalsharq/repo/update_profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  @override
  // TODO: implement initialState
  ChangePasswordState get initialState => PasswordChangeInitial();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is PasswordChangeEvent) {
      yield PasswordChangeLoadingState();
      try {
        UserModel data = await UpdateProfileRepo().changePassword(
            event.userId, event.apiKey, event.newPassword, event.oldPassword);
        yield PasswordChangeLoadedState(response: data);
      } catch (e) {
        yield ChangePasswordErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield PasswordChangeInitial();
    }
  }
}
