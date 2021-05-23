import 'dart:async';

import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/repo/notification_repo.dart';
import 'package:bloc/bloc.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    if (event is NotificationsEvent) {
      yield LoadingState();
      var response = await NotificationRepo().getNotifications();
      yield DoneState(messageResponse: response);
    } else if (event is NotificationsInitial) {
      yield NotificationsInitial();
    }
  }

  @override
  NotificationsState get initialState => NotificationsInitial();
}
