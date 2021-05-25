import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/updateAccount/update_account_event.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/updateAccount/update_account_state.dart';
import 'package:bawabtalsharq/repo/update_profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  @override
  // TODO: implement initialState
  UpdateAccountState get initialState => UpdateAccountInitial();

  @override
  Stream<UpdateAccountState> mapEventToState(UpdateAccountEvent event) async* {
    if (event is UpdateEvent) {
      yield UpdateAccountLoadingState();
      try {
        BaseModel data =
            await UpdateProfileRepo().updateAccount(event.currentUser);
        yield UpdateAccountLoadedState(response: data);
      } catch (e) {
        yield UpdateAccountErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield UpdateAccountInitial();
    }
  }
}
