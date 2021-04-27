import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_bloc.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_state.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Model/privacy_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  PrivacyBloc _privacyBloc;
  List<PrivacyData> privacyList;
  bool isDataLoaded = false;

  @override
  void initState() {
    _privacyBloc = PrivacyBloc();
    _privacyBloc.add(GetPrivacyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).privacy,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocBuilder<PrivacyBloc, PrivacyState>(
        bloc: _privacyBloc,
        builder: (context, state) {
          if (state is PrivacyLoadingState) {
            showLoadingDialog(context);
          } else if (state is PrivacyLoadedState) {
            print('loaded');
            privacyList = state.privacyResponse;
            isDataLoaded = true;
            _privacyBloc.add(ResetState());
            Navigator.pop(context);
          }
          return isDataLoaded
              ? ListView.builder(
                  itemCount: privacyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Html(
                        data: privacyList[index].description,
                      ),
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }
}
