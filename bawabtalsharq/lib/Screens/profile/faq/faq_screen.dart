import 'package:bawabtalsharq/Model/faq_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/faqBloc/faq_bloc.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/faqBloc/faq_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/faqBloc/faq_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  FaqBloc _faqBloc;
  bool isLoading = false;
  bool isLoaded = false;
  List<FaqData> listOfFaq;

  @override
  void initState() {
    _faqBloc = FaqBloc();
    _faqBloc.add(GetFaqEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).faq,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocBuilder<FaqBloc, FaqState>(
          bloc: _faqBloc,
          builder: (context, state) {
            if (state is FaqLoadingState) {
              if (!isLoading) {
                isLoading = true;
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: progressBar(),
                  ),
                );
              }
            } else if (state is FaqLoadedState) {
              listOfFaq = state.faqResponse;
              isLoading = true;
              isLoaded = true;
            }
            return isLoaded
                ? ListView.builder(
                    itemCount: listOfFaq.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 14, left: 20, right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [makeShadow()],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTileCard(
                          shadowColor: Colors.transparent,
                          title: Text(listOfFaq[index].page),
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Html(
                                  data: listOfFaq[index].description,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Container(
                    color: Colors.white,
                    child: Text(Languages.of(context).noNetwork),
                  ));
          }),
    );
  }
}
