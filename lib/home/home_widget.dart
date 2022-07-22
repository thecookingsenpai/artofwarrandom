import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../sssplashhhhh/sssplashhhhh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ApiCallResponse? chosenOne;
  double? ratingBarValue;
  ApiCallResponse? chosenStart;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      chosenStart = await RandomQuoteCall.call();
      setState(() => FFAppState().quotechosen = valueOrDefault<String>(
            RandomQuoteCall.jSONPath1(
              (chosenStart!?.jsonBody ?? ''),
            ).toString(),
            'Undefined',
          ));
      if (FFAppState().myquotes!.contains(FFAppState().quotechosen)) {
        setState(() => FFAppState().favstatus = 'Discard quote');
      } else {
        setState(() => FFAppState().favstatus = 'Save quote');
      }

      HapticFeedback.lightImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
          child: Text(
            'The Art of War - Quotes',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Rubik',
                  color: Color(0xFFD00101),
                ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFE8DCB8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!(loggedIn) ?? true)
                    Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: LoginWidget(),
                                  ),
                                );
                              },
                              text: 'Log in / Sign Up',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFEFEFE),
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            if (!(loggedIn) ?? true)
                              Text(
                                'By signing up you will be able to vote the quotes and to save your favorite ones in the cloud',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (loggedIn ?? true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'My quotes',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Coming Soon'),
                                                        content: Text(
                                                            'This feature is not ready yet :-)'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'My quotes',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Colors.black,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Coming soon'),
                                                        content: Text(
                                                            'This feature is not ready yet :-)'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'Account',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Colors.black,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await signOut();
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SssplashhhhhWidget(),
                                                    ),
                                                    (r) => false,
                                                  );
                                                },
                                                text: 'Logout',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Colors.black,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  if (!(isWeb) ?? true)
                                    FlutterFlowAdBanner(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      showsTestAd: true,
                                      iOSAdUnitID:
                                          'ca-app-pub-5821736815337900/8892512921',
                                      androidAdUnitID:
                                          'ca-app-pub-5821736815337900/8287111918',
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Random Quote',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  chosenOne = await RandomQuoteCall.call();
                                  setState(() => FFAppState().quotechosen =
                                          valueOrDefault<String>(
                                        getJsonField(
                                          (chosenOne!?.jsonBody ?? ''),
                                          r'''$.quote''',
                                        ).toString(),
                                        'Undefined',
                                      ));
                                  if (FFAppState()
                                      .myquotes!
                                      .contains(FFAppState().quotechosen)) {
                                    setState(() => FFAppState().favstatus =
                                        'Discard quote');
                                  } else {
                                    setState(() =>
                                        FFAppState().favstatus = 'Save quote');
                                  }

                                  HapticFeedback.lightImpact();

                                  setState(() {});
                                },
                                text: 'Another one!',
                                options: FFButtonOptions(
                                  width: 130,
                                  color: Color(0xFF680B0B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFAFDFD),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState()
                                      .myquotes!
                                      .contains(FFAppState().quotechosen)) {
                                    setState(() => FFAppState()
                                        .removeFromMyquotes(
                                            FFAppState().quotechosen!));
                                  } else {
                                    setState(() => FFAppState().addToMyquotes(
                                        FFAppState().quotechosen!));
                                  }

                                  if (FFAppState()
                                      .myquotes!
                                      .contains(FFAppState().quotechosen)) {
                                    setState(() => FFAppState().favstatus =
                                        'Discard quote');
                                  } else {
                                    setState(() =>
                                        FFAppState().favstatus = 'Save quote');
                                  }

                                  HapticFeedback.lightImpact();
                                },
                                text: FFAppState().favstatus!,
                                options: FFButtonOptions(
                                  width: 130,
                                  color: Color(0xFF680B0B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFE6AA00),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFAppState().quotechosen!,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (loggedIn ?? true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        if (!(isWeb) ?? true)
                          RatingBar.builder(
                            onRatingUpdate: (newValue) async {
                              setState(() => ratingBarValue = newValue);
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Coming soon'),
                                    content: Text(
                                        'This feature is not ready yet :-)'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            itemBuilder: (context, index) => Icon(
                              Icons.thumb_up,
                              color: Color(0xFFD00101),
                            ),
                            direction: Axis.horizontal,
                            initialRating: ratingBarValue ??= 0,
                            unratedColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            itemCount: 5,
                            itemSize: 40,
                            glowColor: Color(0xFFD00101),
                          ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Disclaimer',
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Rubik',
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'This app contains portion of contents that are not property of the developer. All rights goes to the actual owners. The content presented by this app is distributed under fair use terms.\n',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              FlutterFlowAdBanner(
                width: MediaQuery.of(context).size.width,
                height: 50,
                showsTestAd: true,
                iOSAdUnitID: 'ca-app-pub-5821736815337900/8892512921',
                androidAdUnitID: 'ca-app-pub-5821736815337900/8287111918',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
