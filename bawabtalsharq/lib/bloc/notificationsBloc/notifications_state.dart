part of 'notifications_bloc.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class LoadingState extends NotificationsState {}

class DoneState extends NotificationsState {
  NotificationsModel messageResponse;
  DoneState({this.messageResponse});
}

class NoInternetState extends NotificationsState {}
