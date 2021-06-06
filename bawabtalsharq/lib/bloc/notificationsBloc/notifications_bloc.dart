import 'dart:async';

import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
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
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        yield LoadingState();
        var response = await NotificationRepo().getNotifications();
        yield DoneState(messageResponse: response);
      } else
        yield NoInternetState();
    } else if (event is NotificationsInitial) {
      yield NotificationsInitial();
    }
  }

  @override
  NotificationsState get initialState => NotificationsInitial();
}
