import 'dart:convert';

import 'package:ams/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFeedback extends StatelessWidget {
  const MyFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FeedbackFul();
  }
}

class FeedbackFul extends StatefulWidget {
  const FeedbackFul({Key? key}) : super(key: key);

  @override
  _FeedbackFulState createState() => _FeedbackFulState();
}

class _FeedbackFulState extends State<FeedbackFul> {
  final String _name = "", _email = "", _mobile = "";
  late TextEditingController feedbackController;

  bool isSendFeedback = false;
  bool sendCompliment = true;
  bool reportBug = false;
  bool makeSuggestion = true;

  @override
  void initState() {
    feedbackController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    feedbackController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: ,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: (() {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => Dashboard()));
            }),
          ),
          elevation: 0,
          titleSpacing: 0,
          title: Text(
            "Feedback/Complaint",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _feedback());
  }

  Widget _feedback() {
    return ListView(shrinkWrap: true, children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
        child: Card(
          color: Colors.grey.shade100,
          margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
          elevation: 0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Constant.containerColorExtraLight,
                        child: ClipRRect(
                          child: Image.asset(Constant.addImage),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Constant.textColorDark,
                                ),
                                children: [
                          TextSpan(
                              text: "We appreciate",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Constant.textColorDark,
                              )),
                          TextSpan(
                              text:
                                  " the time you have taken to help us improve our service, Please use the form below to provide us the ",
                              style: TextStyle(
                                fontSize: 10,
                                color: Constant.textColorDark,
                              )),
                          TextSpan(
                              text: "feedback or complaint",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Constant.textColorDark,
                              )),
                        ])))
                  ],
                ),
              ]),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) =>
                      const EdgeInsets.only(
                          left: 12, right: 6, top: 10, bottom: 10)),
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      sendCompliment
                          ? Constant.primaryColor!
                          : Constant.buttonColorLight!),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Send a Compliment',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: sendCompliment
                                ? Constant.textColorExtraLight
                                : Constant.textColorDark),
                      ),
                    ]),
                onPressed: () {
                  setState(() {
                    makeSuggestion = false;
                    isSendFeedback = false;
                    sendCompliment = true;
                    reportBug = false;
                  });
                },
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) =>
                      const EdgeInsets.only(
                          left: 16, right: 8, top: 10, bottom: 10)),
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      isSendFeedback
                          ? Constant.primaryColor!
                          : Constant.buttonColorLight!),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Make a Feedback',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: isSendFeedback
                                ? Constant.textColorExtraLight
                                : Constant.textColorDark),
                      ),
                    ]),
                onPressed: () {
                  setState(() {
                    makeSuggestion = false;
                    isSendFeedback = true;
                    sendCompliment = false;
                    reportBug = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Constant.containerColorExtraLight,
                border: Border.all(
                  color: Constant.textColorExtraLight!,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                children: [
                  TextFormField(
                      controller: feedbackController,
                      maxLines: 10,

                      // inputFormatters: [
                      //   new LengthLimitingTextInputFormatter(10),
                      // ],
                      maxLength: 250,
                      style: TextStyle(
                          fontSize: 13, color: Constant.textColorDark),
                      decoration: InputDecoration(
                        hintText: 'Please write your feedback',
                        hintStyle: TextStyle(
                            fontSize: 12, color: Constant.textColorLight),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Constant.textColorDark!,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constant.textColorDark!, width: 2.0),
                        ),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Max 250 Characters",
                            style: TextStyle(
                                fontSize: 10, color: Constant.textColorLight),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  )
                ],
              ))),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Text(
      //           '''Upload image
      // Max 200kb''',
      //           style: TextStyle(
      //
      //               fontSize: 8.0,
      //               color: Constant.textColorLight),
      //         ),
      //         Padding(
      //             padding: const EdgeInsets.only(left: 10, bottom: 0, right: 20),
      //             child: SvgPicture.asset(
      //               Constant.uploadFeedBacksvg,
      //               width: 20,
      //             )),
      //       ],
      //     )
      _searchButton()
    ]);
  }

  Widget _searchButton() {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      margin: const EdgeInsets.all(10),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.only(left: 16, right: 16)),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFF028040)),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 14.0, color: Constant.textColorExtraLight),
        ),
        onPressed: () {
          if (feedbackController.text.isEmpty) {
            _errToast(
                context, "Please enter your feedback/complaint", Colors.red);
          } else {
            _errToast(context, "Thank you for Your Feedback", Colors.green);
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }

  void _errToast(BuildContext context, String errDesc, Color color) async {
    await Future.delayed(const Duration(microseconds: 1));
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    showToast(errDesc,
        textStyle: TextStyle(
          fontSize: 15.0,
          color: Constant.textColorExtraLight,
        ),
        context: context,
        backgroundColor: color,
        animation: StyledToastAnimation.slideFromBottom,
        reverseAnimation: StyledToastAnimation.slideToBottom,
        startOffset: const Offset(0.0, 3.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: StyledToastPosition.bottom,
        duration: const Duration(seconds: 4),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }

  void _toast(BuildContext context, String errDesc) async {
    await Future.delayed(const Duration(microseconds: 1));
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    showToast(errDesc,
        textStyle: TextStyle(
          fontSize: 15.0,
          color: Constant.textColorExtraLight,
        ),
        context: context,
        animation: StyledToastAnimation.slideFromBottom,
        reverseAnimation: StyledToastAnimation.slideToBottom,
        startOffset: const Offset(0.0, 3.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: StyledToastPosition.bottom,
        duration: const Duration(seconds: 4),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }
}
