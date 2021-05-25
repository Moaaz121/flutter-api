import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/notificationsBloc/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController _mainScrollController = ScrollController();
  NotificationsBloc _bloc = NotificationsBloc();

  @override
  void initState() {
    _bloc.add(GetNotificationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(
                  parent: NeverScrollableScrollPhysics(),
                ),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(start: 15),
                          child: Text(
                            Languages.of(context).notification,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 29.0,
                              color: orangeColor,
                              letterSpacing: 0.34800000000000003,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                  color:
                                      const Color(0xFF7D7D7D).withOpacity(0.16),
                                  offset: Offset(0, 3.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        notification(context),
                      ]),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                end: 20,
                bottom: MediaQuery.of(context).size.height * 0.16,
                child: FloatingActionButton(
                  mini: true,
                  child: Icon(
                    Icons.arrow_upward,
                    color: defaultOrangeColor,
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          )),
    );
  }

  Widget notification(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
          bloc: _bloc,
          builder: (context, snapshot) {
            if (snapshot is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot is DoneState) {
              return ListView.builder(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.23),
                controller: _mainScrollController,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.messageResponse.data.length,
                itemBuilder: (context, position) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(
                        top: 10, start: 14, end: 14, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: orangeColor.withOpacity(0.1),
                          offset: Offset(0, 1.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: notificationItems(
                          snapshot.messageResponse.data[position]),
                    ),
                  );
                },
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }

  Widget notificationItems(Datum datum) {
    Map<String, dynamic> style = {
      "width": '10ch',
      "overflow": 'hidden',
      "text-overflow": 'ellipsis',
      "white-space": 'nowrap',
    };
    return GestureDetector(
      onTap: datum.actionUrl.isNotEmpty ? () {} : null,
      child: Row(
        children: [
          Image(
            image: AssetImage(productImage),
            width: 90,
            height: 90,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                datum.title,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 13.0,
                  color: Color(0xff303030),
                  letterSpacing: 0.14400000000000002,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Html(
                  data: datum.message,
                  onLinkTap: (link) {
                    if (canLaunch(link) != null) {
                      launch(link);
                    } else {
                      throw "Could not launch $link";
                    }
                  }),
            ],
          )),
          datum.actionUrl.isNotEmpty
              ? Icon(
                  Icons.navigate_next,
                  size: 30,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
