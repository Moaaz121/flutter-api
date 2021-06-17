import 'package:flutter/material.dart';
import 'messagecenter_bloc.dart';

import 'package:bawabtalsharq/Model/MessageCenterModel.dart';

abstract class MessagecenterState {}

class MessagecenterInitial extends MessagecenterState {}

class LoadingState extends MessagecenterState {}

class LoadedMessagesState extends MessagecenterState {
  List<MessageCenterData> msgList;

  LoadedMessagesState({@required this.msgList});
}

class MsgCenterNetworkErrorState extends MessagecenterState {}
