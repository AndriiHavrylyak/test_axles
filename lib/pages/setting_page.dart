import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_axles/setting/сonfiguration_styles.dart';
import 'package:test_axles/setting/globalvar.dart' as global;


class Setting extends StatefulWidget {
  @override
  _EditSettingPageState createState() => _EditSettingPageState();
}

class _EditSettingPageState extends State<Setting> {

  late TextEditingController _apiController =  TextEditingController();

  @override
  void initState()   {

    _apiController = TextEditingController( text:  global.urlVar )
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _apiController.dispose();
    super.dispose();
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar( title: Text(StyleSettingPage.textNamePage)),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                TextFormField(
                  controller: _apiController,
                  cursorColor: StyleSettingPage.cursorColor,
                  style: StyleSettingPage.textBody,
                  decoration: InputDecoration(
                    icon: Icon(Icons.insert_link, color: StyleSettingPage.iconColor),
                    hintText: "Адреса сервера",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: StyleSettingPage.BorderSide)),
                    hintStyle: TextStyle(color:StyleSettingPage.notActiveText),
                  ),
                ),
                SizedBox(height: StyleSettingPage.heightBtwButtItem),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: (_apiController.text.replaceAll(" ", "").isNotEmpty) ? seveSettingUrl : null,
                      color: (_apiController.text.replaceAll(" ", "").isNotEmpty) ? StyleSettingPage.activeButtn : StyleSettingPage.notActiveButtn,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(StyleSettingPage.borderRadButton)),
                      child: Text(
                        "Зберегти",
                        style:  StyleSettingPage.textButton
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }


  Future<void> seveSettingUrl() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    prefs.setString('apiUrl', _apiController.text);
    global.urlVar = _apiController.text;
  }

  }



