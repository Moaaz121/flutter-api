import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/sendMessageBloc/send_message_bloc.dart';
import 'package:bawabtalsharq/bloc/sendMessageBloc/send_message_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  SendMessageBloc _bloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  @override
  void initState() {
    _bloc = SendMessageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilderWithWidget(
        titleWidget: buildText(Languages.of(context).technical, 18.0,
            fontFamily: boldFontFamily,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<SendMessageBloc, SendMessageState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: progressBar(),
                ),
              );
            }
            if (state is SentState) {
              if (state.messageResponse.code == 200) {
                emailController.clear();
                subjectController.clear();
                msgController.clear();
                Navigator.of(context).pop();
                showToast(
                    text: "Your message was sent successfully",
                    toastGravity: ToastGravity.CENTER);
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: textFiledMessage(context,
                        text: Languages.of(context).email,
                        controller: emailController),
                  ),
                  textFiledMessage(context,
                      text: Languages.of(context).subject,
                      controller: subjectController),
                  textFiledMessage(context,
                      text: Languages.of(context).writeAMessage,
                      keyboardType: TextInputType.multiline,
                      controller: msgController,
                      lines: 5),
                  submitButton(context, () {
                    if (emailController.text.isNotEmpty &&
                        subjectController.text.isNotEmpty &&
                        msgController.text.isNotEmpty) {
                      _bloc.add(
                        SendEvent(emailController.text, subjectController.text,
                            msgController.text),
                      );
                    }
                  }, Languages.of(context).sendMessage),
                ],
              ),
            );
          }),
      backgroundColor: Colors.white,
    );
  }

  Widget submitButton(BuildContext context, Function _function, String text,
      {double paddingOfWidth = 12}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FlatButton(
        onPressed: _function,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: orangeColor,
            ),
          ),
        ),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 3, color: orangeColor)),
        highlightColor: orangeColor.withOpacity(0.2),
        splashColor: orangeColor.withOpacity(0.5),
      ),
    );
  }

  Widget textFiledMessage(BuildContext context,
      {String text,
      TextInputType keyboardType = TextInputType.text,
      int lines = 1,
      TextEditingController controller}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: TextField(
            controller: controller,
            minLines: 1,
            maxLines: lines,
            keyboardType: keyboardType,
            enabled: true,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              labelText: text,
            ),
          ),
        ),
        SizedBox(height: 24)
      ],
    );
  }
}
