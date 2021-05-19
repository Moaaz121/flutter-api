import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/notificationsBloc/notifications_bloc.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

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
                          child: buildText(
                            Languages.of(context).notification,
                            35.0,
                            fontWeight: FontWeight.bold,
                            color: orangeColor,
                          ),
                        ),
                        notification(context),
                      ]),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                end: 20,
                bottom: MediaQuery.of(context).size.height * 0.14,
                child: buildFloatingActionBtn(
                  icon: Icons.arrow_upward,
                  onPressed: () {
                    _mainScrollController.animateTo(0.0,
                        duration: Duration(seconds: 1), curve: Curves.easeOut);
                  },
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [makeShadow()],
                      color: Colors.white,
                    ),
                    margin: EdgeInsetsDirectional.only(
                        top: 10, start: 14, end: 14, bottom: 10),
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
              buildText(
                datum.title,
                14,
                fontWeight: FontWeight.w500,
              ),
              Html(data: datum.message),
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
