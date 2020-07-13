import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:generify/constants/my_colors.dart';

Widget loadingView() {
  return Container(
    child: Center(
      child: const SpinKitWave(
        color: MyColors.mainTheme,
        size: 50,
      ),
    ),
  );
}
