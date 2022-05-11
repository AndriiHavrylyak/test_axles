import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_axles/pages/seals_page.dart';
import 'package:test_axles/pages/setting_page.dart';
import 'package:test_axles/setting/globalvar.dart' as global;
import 'package:test_axles/setting/сonfiguration_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  global.urlVar =  prefs.getString('apiUrl');
  runApp(MainPage());
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainMenu> {


  int _currentIndex=0;
  List _screens=[SealsPage(),Setting() ];
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child:Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _updateIndex,
            selectedItemColor: Colors.blue[700],
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: "Список пломб",
                icon: Icon(Icons.list),
              ),
              BottomNavigationBarItem(
                label: "Налаштування",
                icon: Icon(Icons.settings),
              ),

            ],
          ),)
    );
  }
  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Ви хочете вийти з додатку?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () =>  {Navigator.of(context).popUntil((route) => route.isFirst) },
            child:
            Text("Ні",
              style: StyleNavigatorText.textBody
            ),
          ),
          SizedBox(height:  StyleNavigatorText.heightBetwCont),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("Так",
              style: StyleNavigatorText.textBody
            ),
          ),
        ],
      ),
    ) ??
        false;
  }


}
