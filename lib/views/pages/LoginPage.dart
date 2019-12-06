import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/views/widgets/login/LoginForm.dart';
import 'package:saving_jim/Utils/ThemedApp.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';

class LoginPage extends StatefulWidget {
  final LoginPageViewModel viewModel;

  LoginPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil to handle Screen Sizes
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 1000, height: 1334, allowFontScaling: true);
    return MaterialApp(
      theme: ThemedApp.getThemeData(),
      home: new Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // Background image
                //Image.asset("assets/images/logo.png"),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo.png",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height: ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text("ESOPE BD",
                            style: TextStyle(
                                fontSize: 58.0,
                                letterSpacing: .09,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(180),
                    ),
                    ScopedModel<LoginPageViewModel>(
                        model: widget.viewModel, child: LoginForm()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
