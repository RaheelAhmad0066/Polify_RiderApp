import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colorconstant/colors.dart';
// import '../../../constants/textcontant/text_constant.dart';
import '../../../provider/night Mode/night_mode.dart';

class ModeSetting extends StatefulWidget {
  const ModeSetting({Key? key}) : super(key: key);

  @override
  State<ModeSetting> createState() => _ModeSettingState();
}

class _ModeSettingState extends State<ModeSetting> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(AppColorConst.yellow),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(AppColorConst.black)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // centerTitle: true,
            title: Text(
              "Night Mode Setting",
              style: TextStyle(
                  fontFamily: "Mulish-Bold",
                  fontSize: 20,
                  color: Color(AppColorConst.black)),
            ),
          ),
          body: Container(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: <Widget>[
                RadioListTile<ThemeMode>(
                  activeColor: Color(AppColorConst.yellow),
                  title: const Text('Light Mode'),
                  groupValue: themeChanger.themeMode,
                  value: ThemeMode.light,
                  onChanged: themeChanger.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  activeColor: Color(AppColorConst.yellow),
                  title: const Text('Dark Mode'),
                  groupValue: themeChanger.themeMode,
                  value: ThemeMode.dark,
                  onChanged: themeChanger.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  activeColor: Color(AppColorConst.yellow),
                  title: const Text('System Mode'),
                  groupValue: themeChanger.themeMode,
                  value: ThemeMode.system,
                  onChanged: themeChanger.setTheme,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
