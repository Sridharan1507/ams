
import 'package:flutter/material.dart';
import 'package:ams/constant.dart';

ThemeData get themeSM {
  return ThemeData(
      fontFamily: 'Poppins',
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.red),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.red,
      ),
      appBarTheme: const AppBarTheme(color: Colors.white),
      iconTheme: const IconThemeData(),
      inputDecorationTheme: const InputDecorationTheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constant.containerColorMedium,
        selectedItemColor: Constant.primaryColor,
        unselectedItemColor: Colors.blue[100],
        showSelectedLabels: true,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Constant.primaryColor!),
            insets: const EdgeInsets.symmetric(horizontal: 16.0)),
        labelColor: kPrimaryColor,
        unselectedLabelColor: Constant.kPrimaryAccentDarkColor!,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // shape: const RoundedRectangleBorder(),
        backgroundColor: Constant.buttonColorDark!,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Constant.textWhiteColor,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey[150],
        thickness: 0.5,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      primaryTextTheme: const TextTheme())
    ..addCustom(CustomThemeFields(
      //region textTitle
      textTitle1_Dark_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),

      textTitle2_Dark_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textTitle2_Dark_SB: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textTitle2_Dark_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textTitle2_Light_L: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),

      textTitle3_Medium_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),

      textTitle4_Dark_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      //endregion

      //region textBody1
      textBody1_Dark_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody1_Blue_SB: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody1_White_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody2
      textBody2_Light_L: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody2_Dark_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody2_Light_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textColorLight),
      textBody2_Dark_SB: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody2_White_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody2_Green_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody2_Green_SB: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constant.textGreenColor),
      textBody2_Red_SB: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.redAccent),
      textBody2_Red_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textColorRed),
      //endregion

      //region textBody3
      textBody3_Dark_B: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Constant.textDarkColor),
      textBody3_Dark_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody3_Dark_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody3_Dark_L: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody3_Light_L: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody3_Light_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody3_Green_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody3_White_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody3_White_L: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody3_Blue_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody3_Red_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      //endregion

      //region textBody4
      textBody4_Dark_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody4_Dark_SB: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody4_Light_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody4_Blue_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody4_Orange_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody4_Light_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody4_White_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody4_White_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody4_Dark_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      //endregion

      //region textBody5
      textBody5_Light_L: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody5_Dark_L: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody5_Light_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody5_Light_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody5_Light_M_Striked: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor,
          decoration: TextDecoration.lineThrough),
      textBody5_LightDark_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.textLightDarkGreyColor),
      textBody5_Medium_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody5_Dark_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody5_Dark_M_Striked: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor,
          decoration: TextDecoration.lineThrough),
      textBody5_Dark_SB: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody5_Blue_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody5_Blue_B: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody5_Medium: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textColorMedium),
      textBody5_Red_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textColorLightShadeRed),
      //endregion

      //region textBody6
      textBody6_Dark_N: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody6_Light_N: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody6_Light_M: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody6_Medium_M: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody6_Dark_M: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody6_Dark_SB: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody6_Gold_N: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Constant.textGoldColor),
      textBody6_Green_N: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody6_White_N: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody6_Orange_M: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody6_Light:
          TextStyle(fontSize: 10, color: Constant.textLightGreyColor),
      textBody6_Light_SB: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      //endregion

      //region textBody7
      textBody7_Light_N: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody7_Dark_N: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody7_Light_SB: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      textBody7_Dark_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody7_Light_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody7_Light_L: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody7_Medium_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody7_Green_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textGreenColor),
      textBody7_Orange_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody7_Red_M: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      textBody7_White_N: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody7_Blue_N: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: Constant.primaryColor),
      textBody7_Orange_N: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: Constant.textOrangeColor),

      //endregion

      //region textBody8
      textBody8_Light_M: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody8_White_SB: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w600,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody9
      textBody9_Pink_SB: TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.w600,
          color: Constant.textPinkColor),
      //endregion
    ));
}

ThemeData get themeMD {
  return ThemeData(
      fontFamily: 'Poppins',
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.red),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.red,
      ),
      appBarTheme: const AppBarTheme(color: Colors.white),
      iconTheme: const IconThemeData(),
      inputDecorationTheme: const InputDecorationTheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constant.containerColorMedium,
        selectedItemColor: Constant.primaryColor,
        unselectedItemColor: Colors.blue[100],
        showSelectedLabels: true,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Constant.primaryColor!),
            insets: const EdgeInsets.symmetric(horizontal: 16.0)),
        labelColor: kPrimaryColor,
        unselectedLabelColor: Constant.kPrimaryAccentDarkColor!,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // shape: const RoundedRectangleBorder(),
        backgroundColor: Constant.buttonColorDark!,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Constant.textWhiteColor,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey[150],
        thickness: 0.5,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      primaryTextTheme: const TextTheme())
    ..addCustom(CustomThemeFields(
      //region textTitle
      textTitle1_Dark_M: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),

      textTitle2_Dark_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textTitle2_Dark_SB: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textTitle2_Dark_N: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textTitle2_Light_L: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),

      textTitle3_Medium_M: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),

      textTitle4_Dark_M: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      //endregion

      //region textBody1
      textBody1_Dark_M: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody1_Blue_SB: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody1_White_M: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody2
      textBody2_Light_L: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody2_Dark_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody2_Light_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textColorLight),
      textBody2_Dark_SB: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody2_White_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody2_Green_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody2_Green_SB: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Constant.textGreenColor),
      textBody2_Red_SB: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.redAccent),
      textBody2_Red_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textColorRed),
      //endregion

      //region textBody3
      textBody3_Dark_B: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Constant.textDarkColor),
      textBody3_Dark_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody3_Dark_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody3_Dark_L: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody3_Light_L: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody3_Light_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody3_Green_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody3_White_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody3_White_L: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody3_Blue_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody3_Red_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      //endregion

      //region textBody4
      textBody4_Dark_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody4_Dark_SB: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody4_Light_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody4_Blue_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody4_Orange_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody4_Light_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody4_White_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody4_White_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody4_Dark_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      //endregion

      //region textBody5
      textBody5_Light_L: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody5_Dark_L: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody5_Light_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody5_Light_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody5_Light_M_Striked: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor,
          decoration: TextDecoration.lineThrough),
      textBody5_LightDark_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textLightDarkGreyColor),
      textBody5_Medium_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody5_Dark_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody5_Dark_M_Striked: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor,
          decoration: TextDecoration.lineThrough),
      textBody5_Dark_SB: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody5_Blue_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody5_Blue_B: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody5_Medium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textColorMedium),
      textBody5_Red_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textColorLightShadeRed),
      //endregion

      //region textBody6
      textBody6_Dark_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody6_Light_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody6_Light_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody6_Medium_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody6_Dark_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody6_Dark_SB: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody6_Gold_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textGoldColor),
      textBody6_Green_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody6_White_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody6_Orange_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody6_Light:
          TextStyle(fontSize: 12, color: Constant.textLightGreyColor),
      textBody6_Light_SB: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      //endregion

      //region textBody7
      textBody7_Light_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody7_Dark_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody7_Light_SB: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      textBody7_Dark_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody7_Light_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody7_Light_L: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody7_Medium_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody7_Green_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textGreenColor),
      textBody7_Orange_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody7_Red_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      textBody7_White_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody7_Blue_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.primaryColor),
      textBody7_Orange_N: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Constant.textOrangeColor),

      //endregion

      //region textBody8
      textBody8_Light_M: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody8_White_SB: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody9
      textBody9_Pink_SB: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: Constant.textPinkColor),
      //endregion
    ));
}

ThemeData get themeLG {
  return ThemeData(
      fontFamily: 'Poppins',
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.red),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.red,
      ),
      appBarTheme: const AppBarTheme(color: Colors.white),
      iconTheme: const IconThemeData(),
      inputDecorationTheme: const InputDecorationTheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constant.containerColorMedium,
        selectedItemColor: Constant.primaryColor,
        unselectedItemColor: Colors.blue[100],
        showSelectedLabels: true,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Constant.primaryColor!),
            insets: const EdgeInsets.symmetric(horizontal: 16.0)),
        labelColor: kPrimaryColor,
        unselectedLabelColor: Constant.kPrimaryAccentDarkColor!,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // shape: const RoundedRectangleBorder(),
        backgroundColor: Constant.buttonColorDark!,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Constant.textWhiteColor,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey[150],
        thickness: 0.5,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      primaryTextTheme: const TextTheme())
    ..addCustom(CustomThemeFields(
      //region textTitle
      textTitle1_Dark_M: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),

      textTitle2_Dark_M: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textTitle2_Dark_SB: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textTitle2_Dark_N: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textTitle2_Light_L: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),

      textTitle3_Medium_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),

      textTitle4_Dark_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      //endregion

      //region textBody1
      textBody1_Dark_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody1_Blue_SB: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody1_White_M: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody2
      textBody2_Light_L: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody2_Dark_M: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody2_Light_N: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Constant.textColorLight),
      textBody2_Dark_SB: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody2_White_N: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody2_Green_N: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody2_Green_SB: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Constant.textGreenColor),
      textBody2_Red_SB: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w600, color: Colors.redAccent),
      textBody2_Red_N: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Constant.textColorRed),
      //endregion

      //region textBody3
      textBody3_Dark_B: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Constant.textDarkColor),
      textBody3_Dark_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody3_Dark_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody3_Dark_L: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody3_Light_L: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody3_Light_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody3_Green_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody3_White_N: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody3_White_L: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody3_Blue_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody3_Red_M: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      //endregion

      //region textBody4
      textBody4_Dark_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody4_Dark_SB: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody4_Light_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody4_Blue_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody4_Orange_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody4_Light_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody4_White_M: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Constant.textWhiteColor),
      textBody4_White_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody4_Dark_N: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      //endregion

      //region textBody5
      textBody5_Light_L: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody5_Dark_L: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Constant.textDarkColor),
      textBody5_Light_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody5_Light_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody5_Light_M_Striked: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor,
          decoration: TextDecoration.lineThrough),
      textBody5_LightDark_N: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Constant.textLightDarkGreyColor),
      textBody5_Medium_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody5_Dark_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody5_Dark_M_Striked: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor,
          decoration: TextDecoration.lineThrough),
      textBody5_Dark_SB: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody5_Blue_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textBlueColor),
      textBody5_Blue_B: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constant.textBlueColor),
      textBody5_Medium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textColorMedium),
      textBody5_Red_M: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Constant.textColorLightShadeRed),
      //endregion

      //region textBody6
      textBody6_Dark_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody6_Light_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody6_Light_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody6_Medium_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody6_Dark_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody6_Dark_SB: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Constant.textDarkColor),
      textBody6_Gold_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textGoldColor),
      textBody6_Green_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textGreenColor),
      textBody6_White_N: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Constant.textWhiteColor),
      textBody6_Orange_M: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody6_Light:
          TextStyle(fontSize: 13, color: Constant.textLightGreyColor),
      textBody6_Light_SB: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      //endregion

      //region textBody7
      textBody7_Light_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textLightGreyColor),
      textBody7_Dark_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textDarkColor),
      textBody7_Light_SB: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Constant.textLightGreyColor),
      textBody7_Dark_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textDarkColor),
      textBody7_Light_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody7_Light_L: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Constant.textLightGreyColor),
      textBody7_Medium_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textMediumGreyColor),
      textBody7_Green_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textGreenColor),
      textBody7_Orange_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textOrangeColor),
      textBody7_Red_M: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Constant.textRedColor),
      textBody7_White_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Constant.textWhiteColor),
      textBody7_Blue_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.primaryColor),
      textBody7_Orange_N: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Constant.textOrangeColor),

      //endregion

      //region textBody8
      textBody8_Light_M: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Constant.textLightGreyColor),
      textBody8_White_SB: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Constant.textWhiteColor),
      //endregion

      //region textBody9
      textBody9_Pink_SB: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Constant.textPinkColor),
      //endregion
    ));
}

class CustomThemeFields {
  final TextStyle textTitle1_Dark_M;
  final TextStyle textTitle2_Dark_M;
  final TextStyle textTitle2_Dark_SB;
  final TextStyle textTitle3_Medium_M;
  final TextStyle textTitle4_Dark_M;

  final TextStyle textBody1_Dark_M;
  final TextStyle textBody1_Blue_SB;
  final TextStyle textBody1_White_M;

  final TextStyle textBody2_Dark_M;
  final TextStyle textBody2_Light_N;
  final TextStyle textBody2_Dark_SB;
  final TextStyle textBody2_White_N;

  final TextStyle textBody3_Dark_B;
  final TextStyle textBody3_Dark_N;
  final TextStyle textBody3_Dark_M;
  final TextStyle textBody3_Light_L;
  final TextStyle textBody3_Light_M;
  final TextStyle textBody3_Green_N;
  final TextStyle textBody3_White_N;
  final TextStyle textBody3_White_L;
  final TextStyle textBody3_Blue_M;
  final TextStyle textBody3_Red_M;

  final TextStyle textBody4_Dark_M;
  final TextStyle textBody4_Light_M;
  final TextStyle textBody4_Blue_M;
  final TextStyle textBody4_Orange_M;
  final TextStyle textBody4_Light_N;
  final TextStyle textBody4_White_M;
  final TextStyle textBody4_White_N;

  final TextStyle textBody5_Light_N;
  final TextStyle textBody5_Light_M;
  final TextStyle textBody5_Light_M_Striked;
  final TextStyle textBody5_LightDark_N;
  final TextStyle textBody5_Medium_M;
  final TextStyle textBody5_Dark_M;
  final TextStyle textBody5_Dark_M_Striked;
  final TextStyle textBody5_Dark_SB;
  final TextStyle textBody5_Blue_M;
  final TextStyle textBody5_Blue_B;

  final TextStyle textBody6_Dark_N;
  final TextStyle textBody6_Light_N;
  final TextStyle textBody6_Light_M;
  final TextStyle textBody6_Medium_M;
  final TextStyle textBody6_Dark_M;
  final TextStyle textBody6_Dark_SB;
  final TextStyle textBody6_Gold_N;
  final TextStyle textBody6_Green_N;
  final TextStyle textBody6_White_N;

  final TextStyle textBody7_Light_N;
  final TextStyle textBody7_Dark_N;
  final TextStyle textBody7_Light_SB;
  final TextStyle textBody7_Dark_M;
  final TextStyle textBody7_Light_M;
  final TextStyle textBody7_Light_L;
  final TextStyle textBody7_Medium_M;
  final TextStyle textBody7_Green_M;
  final TextStyle textBody7_Orange_M;
  final TextStyle textBody7_Red_M;
  final TextStyle textBody7_White_N;

  final TextStyle textBody8_Light_M;
  final TextStyle textBody8_White_SB;
  final TextStyle textBody9_Pink_SB;
  final TextStyle textBody2_Green_N;
  final TextStyle textBody2_Green_SB;
  final TextStyle textBody7_Blue_N;
  final TextStyle textBody6_Orange_M;
  final TextStyle textBody6_Light;
  final TextStyle textBody4_Dark_SB;
  final TextStyle textBody5_Medium;
  final TextStyle textBody5_Red_M;
  final TextStyle textBody7_Pink_SB;
  final TextStyle textTitle2_Dark_N;
  final TextStyle textBody3_Dark_L;
  final TextStyle textTitle2_Light_L;
  final TextStyle textBody5_Light_L;
  final TextStyle textBody2_Light_L;
  final TextStyle textBody2_Red_SB;
  final TextStyle textBody5_Dark_L;
  final TextStyle textBody6_Light_SB;
  final TextStyle textBody7_Orange_N;
  final TextStyle textBody4_Dark_N;
  final TextStyle textBody2_Red_N;

  const CustomThemeFields({
    TextStyle? textTitle1_Dark_M,
    TextStyle? textTitle2_Dark_M,
    TextStyle? textTitle2_Dark_SB,
    TextStyle? textTitle3_Medium_M,
    TextStyle? textTitle4_Dark_M,
    TextStyle? textBody1_Dark_M,
    TextStyle? textBody1_Blue_SB,
    TextStyle? textBody1_White_M,
    TextStyle? textBody2_Dark_M,
    TextStyle? textBody2_Light_N,
    TextStyle? textBody2_Dark_SB,
    TextStyle? textBody2_White_N,
    TextStyle? textBody3_Dark_B,
    TextStyle? textBody3_Dark_N,
    TextStyle? textBody3_Dark_M,
    TextStyle? textBody3_Light_L,
    TextStyle? textBody3_Light_M,
    TextStyle? textBody3_Green_N,
    TextStyle? textBody3_White_N,
    TextStyle? textBody3_White_L,
    TextStyle? textBody3_Blue_M,
    TextStyle? textBody3_Red_M,
    TextStyle? textBody4_Dark_M,
    TextStyle? textBody4_Light_M,
    TextStyle? textBody4_Blue_M,
    TextStyle? textBody4_Orange_M,
    TextStyle? textBody4_Light_N,
    TextStyle? textBody4_White_M,
    TextStyle? textBody4_White_N,
    TextStyle? textBody5_Light_N,
    TextStyle? textBody5_Light_M,
    TextStyle? textBody5_Light_M_Striked,
    TextStyle? textBody5_LightDark_N,
    TextStyle? textBody5_Medium_M,
    TextStyle? textBody5_Dark_M,
    TextStyle? textBody5_Dark_M_Striked,
    TextStyle? textBody5_Dark_SB,
    TextStyle? textBody5_Blue_M,
    TextStyle? textBody5_Blue_B,
    TextStyle? textBody6_Dark_N,
    TextStyle? textBody6_Light_N,
    TextStyle? textBody6_Light_M,
    TextStyle? textBody6_Medium_M,
    TextStyle? textBody6_Dark_M,
    TextStyle? textBody6_Dark_SB,
    TextStyle? textBody6_Gold_N,
    TextStyle? textBody6_Green_N,
    TextStyle? textBody6_White_N,
    TextStyle? textBody7_Light_N,
    TextStyle? textBody7_Dark_N,
    TextStyle? textBody7_Light_SB,
    TextStyle? textBody7_Dark_M,
    TextStyle? textBody7_Light_M,
    TextStyle? textBody7_Light_L,
    TextStyle? textBody7_Medium_M,
    TextStyle? textBody7_Green_M,
    TextStyle? textBody7_Orange_M,
    TextStyle? textBody7_Red_M,
    TextStyle? textBody7_White_N,
    TextStyle? textBody8_Light_M,
    TextStyle? textBody8_White_SB,
    TextStyle? textBody9_Pink_SB,
    TextStyle? textBody2_Green_N,
    TextStyle? textBody2_Green_SB,
    TextStyle? textBody7_Blue_N,
    TextStyle? textBody6_Orange_M,
    TextStyle? textBody6_Light,
    TextStyle? textBody4_Dark_SB,
    TextStyle? textBody5_Medium,
    TextStyle? textBody5_Red_M,
    TextStyle? textBody7_Pink_SB,
    TextStyle? textTitle2_Dark_N,
    TextStyle? textBody3_Dark_L,
    TextStyle? textTitle2_Light_L,
    TextStyle? textBody5_Light_L,
    TextStyle? textBody2_Light_L,
    TextStyle? textBody2_Red_SB,
    TextStyle? textBody5_Dark_L,
    TextStyle? textBody6_Light_SB,
    TextStyle? textBody7_Orange_N,
    TextStyle? textBody4_Dark_N,
    TextStyle? textBody2_Red_N,
  })  : textTitle1_Dark_M = textTitle1_Dark_M ?? const TextStyle(fontSize: 12),
        textTitle2_Dark_M = textTitle2_Dark_M ?? const TextStyle(fontSize: 12),
        textTitle2_Dark_SB =
            textTitle2_Dark_SB ?? const TextStyle(fontSize: 12),
        textTitle3_Medium_M =
            textTitle3_Medium_M ?? const TextStyle(fontSize: 12),
        textTitle4_Dark_M = textTitle4_Dark_M ?? const TextStyle(fontSize: 12),
        textBody1_Dark_M = textBody1_Dark_M ?? const TextStyle(fontSize: 12),
        textBody1_Blue_SB = textBody1_Blue_SB ?? const TextStyle(fontSize: 12),
        textBody1_White_M = textBody1_White_M ?? const TextStyle(fontSize: 12),
        textBody2_Dark_M = textBody2_Dark_M ?? const TextStyle(fontSize: 12),
        textBody2_Light_N = textBody2_Light_N ?? const TextStyle(fontSize: 12),
        textBody2_Dark_SB = textBody2_Dark_SB ?? const TextStyle(fontSize: 12),
        textBody2_White_N = textBody2_White_N ?? const TextStyle(fontSize: 12),
        textBody3_Dark_B = textBody3_Dark_B ?? const TextStyle(fontSize: 12),
        textBody3_Dark_N = textBody3_Dark_N ?? const TextStyle(fontSize: 12),
        textBody3_Dark_M = textBody3_Dark_M ?? const TextStyle(fontSize: 12),
        textBody3_Light_L = textBody3_Light_L ?? const TextStyle(fontSize: 12),
        textBody3_Light_M = textBody3_Light_M ?? const TextStyle(fontSize: 12),
        textBody3_Green_N = textBody3_Green_N ?? const TextStyle(fontSize: 12),
        textBody3_White_N = textBody3_White_N ?? const TextStyle(fontSize: 12),
        textBody3_White_L = textBody3_White_L ?? const TextStyle(fontSize: 12),
        textBody3_Blue_M = textBody3_Blue_M ?? const TextStyle(fontSize: 12),
        textBody3_Red_M = textBody3_Red_M ?? const TextStyle(fontSize: 12),
        textBody4_Dark_M = textBody4_Dark_M ?? const TextStyle(fontSize: 12),
        textBody4_Light_M = textBody4_Light_M ?? const TextStyle(fontSize: 12),
        textBody4_Blue_M = textBody4_Blue_M ?? const TextStyle(fontSize: 12),
        textBody4_Orange_M =
            textBody4_Orange_M ?? const TextStyle(fontSize: 12),
        textBody4_Light_N = textBody4_Light_N ?? const TextStyle(fontSize: 12),
        textBody4_White_M = textBody4_White_M ?? const TextStyle(fontSize: 12),
        textBody4_White_N = textBody4_White_N ?? const TextStyle(fontSize: 12),
        textBody5_Light_N = textBody5_Light_N ?? const TextStyle(fontSize: 12),
        textBody5_Light_M = textBody5_Light_M ?? const TextStyle(fontSize: 12),
        textBody5_Light_M_Striked =
            textBody5_Light_M_Striked ?? const TextStyle(fontSize: 12),
        textBody5_LightDark_N =
            textBody5_LightDark_N ?? const TextStyle(fontSize: 12),
        textBody5_Medium_M =
            textBody5_Medium_M ?? const TextStyle(fontSize: 12),
        textBody5_Dark_M = textBody5_Dark_M ?? const TextStyle(fontSize: 12),
        textBody5_Dark_M_Striked =
            textBody5_Dark_M_Striked ?? const TextStyle(fontSize: 12),
        textBody5_Dark_SB = textBody5_Dark_SB ?? const TextStyle(fontSize: 12),
        textBody5_Blue_M = textBody5_Blue_M ?? const TextStyle(fontSize: 12),
        textBody5_Blue_B = textBody5_Blue_B ?? const TextStyle(fontSize: 12),
        textBody6_Dark_N = textBody6_Dark_N ?? const TextStyle(fontSize: 12),
        textBody6_Light_N = textBody6_Light_N ?? const TextStyle(fontSize: 12),
        textBody6_Light_M = textBody6_Light_M ?? const TextStyle(fontSize: 12),
        textBody6_Medium_M =
            textBody6_Medium_M ?? const TextStyle(fontSize: 12),
        textBody6_Dark_M = textBody6_Dark_M ?? const TextStyle(fontSize: 12),
        textBody6_Dark_SB = textBody6_Dark_SB ?? const TextStyle(fontSize: 12),
        textBody6_Gold_N = textBody6_Gold_N ?? const TextStyle(fontSize: 12),
        textBody6_Green_N = textBody6_Green_N ?? const TextStyle(fontSize: 12),
        textBody6_White_N = textBody6_White_N ?? const TextStyle(fontSize: 12),
        textBody7_Light_N = textBody7_Light_N ?? const TextStyle(fontSize: 12),
        textBody7_Dark_N = textBody7_Dark_N ?? const TextStyle(fontSize: 12),
        textBody7_Light_SB =
            textBody7_Light_SB ?? const TextStyle(fontSize: 12),
        textBody7_Dark_M = textBody7_Dark_M ?? const TextStyle(fontSize: 12),
        textBody7_Light_M = textBody7_Light_M ?? const TextStyle(fontSize: 12),
        textBody7_Light_L = textBody7_Light_L ?? const TextStyle(fontSize: 12),
        textBody7_Medium_M =
            textBody7_Medium_M ?? const TextStyle(fontSize: 12),
        textBody7_Green_M = textBody7_Green_M ?? const TextStyle(fontSize: 12),
        textBody7_Orange_M =
            textBody7_Orange_M ?? const TextStyle(fontSize: 12),
        textBody7_Red_M = textBody7_Red_M ?? const TextStyle(fontSize: 12),
        textBody7_White_N = textBody7_White_N ?? const TextStyle(fontSize: 12),
        textBody8_Light_M = textBody8_Light_M ?? const TextStyle(fontSize: 12),
        textBody8_White_SB =
            textBody8_White_SB ?? const TextStyle(fontSize: 14),
        textBody9_Pink_SB = textBody9_Pink_SB ?? const TextStyle(fontSize: 12),
        textBody2_Green_N = textBody2_Green_N ?? const TextStyle(fontSize: 12),
        textBody2_Green_SB =
            textBody2_Green_SB ?? const TextStyle(fontSize: 12),
        textBody7_Blue_N = textBody7_Blue_N ?? const TextStyle(fontSize: 12),
        textBody6_Orange_M =
            textBody6_Orange_M ?? const TextStyle(fontSize: 12),
        textBody6_Light = textBody6_Light ?? const TextStyle(fontSize: 12),
        textBody4_Dark_SB = textBody4_Dark_SB ?? const TextStyle(fontSize: 12),
        textBody5_Medium = textBody5_Medium ?? const TextStyle(fontSize: 12),
        textBody5_Red_M = textBody5_Red_M ?? const TextStyle(fontSize: 12),
        textBody7_Pink_SB = textBody7_Pink_SB ?? const TextStyle(fontSize: 12),
        textTitle2_Dark_N = textTitle2_Dark_N ?? const TextStyle(fontSize: 12),
        textBody3_Dark_L = textBody3_Dark_L ?? const TextStyle(fontSize: 12),
        textTitle2_Light_L =
            textTitle2_Light_L ?? const TextStyle(fontSize: 12),
        textBody5_Light_L = textBody5_Light_L ?? const TextStyle(fontSize: 12),
        textBody2_Light_L = textBody5_Light_L ?? const TextStyle(fontSize: 12),
        textBody2_Red_SB = textBody2_Red_SB ?? const TextStyle(fontSize: 12),
        textBody5_Dark_L = textBody5_Dark_L ?? const TextStyle(fontSize: 12),
        textBody6_Light_SB =
            textBody6_Light_SB ?? const TextStyle(fontSize: 12),
        textBody7_Orange_N =
            textBody7_Orange_N ?? const TextStyle(fontSize: 12),
        textBody4_Dark_N = textBody4_Dark_N ?? const TextStyle(fontSize: 12),
        textBody2_Red_N = textBody2_Red_N ?? const TextStyle(fontSize: 12);
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, CustomThemeFields> _own = {};

  void addCustom(CustomThemeFields own) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _own[inputDecorationTheme] = own;
  }

  static CustomThemeFields? empty;

  CustomThemeFields custom() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= const CustomThemeFields();
      o = empty;
    }
    return o!;
  }
}

CustomThemeFields ownTheme(BuildContext context) => Theme.of(context).custom();

// class Constant {
// //Theme color
//   static Color? textDarkColor = const Color(0xff293855);
//   static Color? textLightGreyColor = const Color(0xff999BA4);
//   static Color? textMediumGreyColor = const Color(0xff7284A8);
//   static Color? textLightDarkGreyColor = const Color(0xff737682);
//   static Color? textBlueColor = const Color(0xff0087F5);
//   static Color? textGreenColor = const Color(0xff64B92A);
//   static Color? textRedColor = const Color(0xffC83B2D);
//   static Color? textOrangeColor = const Color(0xffF66B13);
//   static Color? textGoldColor = const Color(0xffD7AF0D);
//   static Color? textPinkColor = const Color(0xffFF70AC);
//   static Color? textWhiteColor = const Color(0xffFFFFFF);
// //endregion
// }
