import 'package:bawabtalsharq/Model/aboutUs_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/aboutUsBloc/aboutUs_bloc.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/aboutUsBloc/aboutUs_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/aboutUsBloc/aboutUs_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  AboutUsBloc _aboutUsBloc;
  List<AboutData> aboutUsList;
  bool isDataLoaded = false;

  @override
  void initState() {
    _aboutUsBloc = AboutUsBloc();
    _aboutUsBloc.add(GetAboutUsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).aboutUs,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocBuilder<AboutUsBloc, AboutUsState>(
        bloc: _aboutUsBloc,
        builder: (context, state) {
          if (state is AboutUsLoadingState) {
            showLoadingDialog(context);
          } else if (state is AboutUsLoadedState) {
            print('loaded');
            aboutUsList = state.aboutUsResponse;
            isDataLoaded = true;
            _aboutUsBloc.add(ResetState());
            Navigator.pop(context);
          }
          return isDataLoaded
              ? ListView.builder(
                  itemCount: aboutUsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Html(
                        data: aboutUsList[index].description,
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
