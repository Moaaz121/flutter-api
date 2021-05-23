import 'package:bawabtalsharq/Model/privacy_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_bloc.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  PrivacyBloc _privacyBloc;
  List<PrivacyData> privacyList;
  bool isLoading = false;
  bool isLoaded = false;

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
            if (!isLoading) {
              isLoading = true;
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          } else if (state is PrivacyLoadedState) {
            print('loaded');
            privacyList = state.privacyResponse;
            isLoading = true;
            isLoaded = true;
          }
          return isLoaded
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
              : Center(
                  child: Container(
                  color: Colors.white,
                  child: Text('No Internet Connection'),
                ));
        },
      ),
    );
  }
}
