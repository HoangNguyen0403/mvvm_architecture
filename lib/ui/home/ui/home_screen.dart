import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_architecture/config/styles.dart';
import 'package:mvvm_architecture/config/theme.dart';
import 'package:mvvm_architecture/utils/di/injection.dart';
import 'package:mvvm_architecture/utils/multi-languages/multi_languages_utils.dart';
import 'package:mvvm_architecture/utils/route/app_routing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _keyRed = GlobalKey();
  String containerSize = "";

  String get _containerSize =>
      containerSize.isNotEmpty ? "Container Width Height : $containerSize" : "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            key: _keyRed,
            width: 375.w,
            height: 500.h,
            color: Colors.red,
            child: Text(
              "Screen Width : ${ScreenUtil().screenWidth}  Height : ${ScreenUtil().screenHeight}"
              "\n$_containerSize "
              "\nWidth Ratio : ${ScreenUtil().scaleWidth} "
              "\nHeight Ratio : ${ScreenUtil().scaleHeight} "
              "\nText Ratio : ${ScreenUtil().scaleText} "
              "\n$defaultTargetPlatform",
              style: AppTextStyle.label3,
            ),
          ),
          Text(
            "Aspect Ratio : ${ScreenUtil().pixelRatio}",
            style: AppTextStyle.label3,
          ),
          Text(
            LocaleKeys.msg.tr(
              namedArgs: {"userName": "Hoang"},
              args: ["All"],
            ),
            style: AppTextStyle.label3,
          ),
          OutlinedButton(
            onPressed: () {
              _getSizes();
            },
            child: Text(
              "Get Size",
              style: AppTextStyle.label3,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              getIt<AppTheme>().changeTheme();
            },
            child: Text(
              "Change Theme",
              style: AppTextStyle.label3,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteDefine.listUserScreen.name);
            },
            child: Text(
              "Move To List User Screen",
              style: AppTextStyle.label3,
            ),
          ),
        ],
      ),
    );
  }

  void _getSizes() {
    final renderBoxRed = _keyRed.currentContext!.findRenderObject();
    final sizeRed = renderBoxRed!.paintBounds.size;
    setState(() {
      containerSize = sizeRed.toString();
    });
  }
}
