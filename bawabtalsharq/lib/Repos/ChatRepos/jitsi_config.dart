import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';

class JitsiConfig {
  JitsiConfig._privateConstructor();
  static final JitsiConfig instance = JitsiConfig._privateConstructor();

  var _options = JitsiMeetingOptions();

  void joinMeeting(BuildContext context, bool isVideo, String roomID,
      PartnerData partner) async {
    try {
      _meetingConfiguration(context, isVideo, roomID, partner);
      await JitsiMeet.joinMeeting(_options);
    } catch (error) {
      print("error: $error");
    }
  }

  void _meetingConfiguration(
      BuildContext context, bool isVideo, String roomID, PartnerData partner) {
    FeatureFlag featureFlag = FeatureFlag();
    featureFlag.welcomePageEnabled = false;
    featureFlag.resolution = FeatureFlagVideoResolution.HD_RESOLUTION;
    featureFlag.addPeopleEnabled = false;
    featureFlag.chatEnabled = false;
    featureFlag.inviteEnabled = false;
    featureFlag.kickOutEnabled = false;
    featureFlag.raiseHandEnabled = false;
    featureFlag.recordingEnabled = false;
    featureFlag.videoShareButtonEnabled = true;
    featureFlag.closeCaptionsEnabled = false;
    featureFlag.welcomePageEnabled = false;
    featureFlag.pipEnabled = false;
    featureFlag.callIntegrationEnabled = false;
    featureFlag.iOSRecordingEnabled = false;
    _options.room = roomID; // Required, spaces will be trimmed
    _options.serverURL = APIS.jitsiURL;
    _options.subject = Languages.of(context).meetingWith + partner.user.name;
    _options.userDisplayName = partner.user.name;
    _options.userEmail = partner.user.username;
    _options.userAvatarURL =
        'https://pbs.twimg.com/profile_images/1302962150302982146/NTb6iGpC.jpg';
    _options.audioOnly = isVideo ? false : true;
    _options.audioMuted = false;
    _options.videoMuted = !isVideo;
    _options.featureFlag = featureFlag;
  }

  void jitsiListener() {
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  void closeMeeting(BuildContext context) {
    JitsiMeet.closeMeeting();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.popUntil(
          context, ModalRoute.withName(ScreenRoutes.conversationScreen));
    });
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
