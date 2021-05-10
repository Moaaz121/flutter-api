import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Model/history_model.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_bloc.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  final UserModel currentUser;

  HistoryScreen(this.currentUser);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  ScrollController _scrollController = ScrollController();
  HistoryBloc _historyBloc;
  bool isLoading = false;
  bool isLoaded = false;

  List<Product> products;

  @override
  void initState() {
    print(widget.currentUser.data.firstname);
    _historyBloc = HistoryBloc();
    _historyBloc.add(GetHistoryEvent(
        widget.currentUser.data.userId, widget.currentUser.data.apiKey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: _historyBloc,
      builder: (context, state) {
        if (state is HistoryLoadingState) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is HistoryLoadedState) {
          isLoaded = true;
          products = state.response.product;
        }
        return isLoaded
            ? Scaffold(
                floatingActionButton: buildFloatingActionBtn(
                    icon: Icons.arrow_upward_rounded,
                    onPressed: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOut);
                    }),
                appBar: appBarBuilder(
                    title: Languages.of(context).history,
                    onBackPressed: () {
                      Navigator.of(context).pop();
                    }),
                body: Column(children: [
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: products.length,
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ScreenRoutes.individualProduct);
                          },
                          child: productItemLandscape2(context,
                              products: products, index: position),
                        );
                      },
                    ),
                  ),
                ]),
              )
            : Container();
      },
    );
  }
}
