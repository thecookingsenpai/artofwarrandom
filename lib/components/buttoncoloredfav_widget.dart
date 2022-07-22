import '../auth/firebase_user_provider.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtoncoloredfavWidget extends StatefulWidget {
  const ButtoncoloredfavWidget({Key? key}) : super(key: key);

  @override
  _ButtoncoloredfavWidgetState createState() => _ButtoncoloredfavWidgetState();
}

class _ButtoncoloredfavWidgetState extends State<ButtoncoloredfavWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loggedIn ?? true,
      child: FlutterFlowIconButton(
        borderColor: Color(0x00F30000),
        borderRadius: 30,
        borderWidth: 0,
        buttonSize: 60,
        fillColor: Colors.black,
        icon: Icon(
          Icons.favorite_border,
          color: Color(0xFFFAFDFD),
          size: 30,
        ),
        onPressed: () async {
          if (FFAppState().myquotes!.contains(FFAppState().quotechosen)) {
            setState(() =>
                FFAppState().removeFromMyquotes(FFAppState().quotechosen!));
          } else {
            setState(
                () => FFAppState().addToMyquotes(FFAppState().quotechosen!));
          }
        },
      ),
    );
  }
}
