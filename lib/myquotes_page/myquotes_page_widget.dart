import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MyquotesPageWidget extends StatefulWidget {
  const MyquotesPageWidget({Key? key}) : super(key: key);

  @override
  _MyquotesPageWidgetState createState() => _MyquotesPageWidgetState();
}

class _MyquotesPageWidgetState extends State<MyquotesPageWidget> {
  String? favchosen1;
  String? favchosen2;
  String? seldata;
  String? favchosen;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      favchosen = await actions.getFromList(
        FFAppState().myquotes!.toList(),
        -1,
      );
      setState(() => FFAppState().favquoteselect = favchosen!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFFEFEFEF),
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 220),
                reverseDuration: Duration(milliseconds: 220),
                child: HomeWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Your Quotes',
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              thickness: 1,
              color: FlutterFlowTheme.of(context).lineColor,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF680B0B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        favchosen1 = await actions.getFromList(
                                          FFAppState().myquotes!.toList(),
                                          -1,
                                        );
                                        setState(() => FFAppState()
                                            .favquoteselect = favchosen1!);

                                        setState(() {});
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Text(
                                        FFAppState().favquoteselect!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        favchosen2 = await actions.getFromList(
                                          FFAppState().myquotes!.toList(),
                                          -1,
                                        );
                                        setState(() => FFAppState()
                                            .favquoteselect = favchosen2!);

                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () async {
                              if (FFAppState()
                                  .myquotes!
                                  .contains(FFAppState().favquoteselect)) {
                                setState(() => FFAppState().removeFromMyquotes(
                                    FFAppState().favquoteselect!));
                              }
                              seldata = await actions.getFromList(
                                FFAppState().myquotes!.toList(),
                                -1,
                              );
                              setState(
                                  () => FFAppState().favquoteselect = seldata!);

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.ios_share,
                              color: Color(0xFFF1F1F1),
                              size: 30,
                            ),
                            onPressed: () async {
                              await Share.share(FFAppState().favquoteselect!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!(isWeb) ?? true)
                    FlutterFlowAdBanner(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      showsTestAd: true,
                      iOSAdUnitID: 'ca-app-pub-5821736815337900/8892512921',
                      androidAdUnitID: 'ca-app-pub-5821736815337900/8287111918',
                    ),
                  if (!(isWeb) ?? true)
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
          ],
        ),
      ),
    );
  }
}
