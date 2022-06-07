
import 'package:balance/bloc/main/home/countdown_bloc.dart';
import 'package:balance/bloc/main/home/events/countdown_events.dart';
import 'package:balance/screens/main/halo/datamanagement_screen.dart';
import 'package:flutter/material.dart';
import 'package:balance/screens/res/b_icons.dart';
import 'package:balance/screens/main/widgets/google_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';

import 'charts/chart_screen.dart';
import 'home/home_screen.dart';
import 'measurements/measurements_screen.dart';
import 'settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _initialPage = 0;
  // Index of the current page open
  int _currentIndex;
  List<Widget> _pages;
  List<String> _titles;

  @override
  void initState() {
    _currentIndex = _initialPage;
    _pages = [HomeScreen(), MeasurementsScreen(), ChartsScreen(), DataManagementScreen(), SettingsScreen()];
    _titles = ['home_txt'.tr(), 'tests_txt'.tr(), 'chart_txt'.tr(), 'Halo'.tr(), 'settings_txt'.tr()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: WillPopScope(
        onWillPop: () => Future.sync(() {
          // When back button is pressed return to initial page or close the app
          if (_currentIndex == _initialPage) return true;
          setState(() => _currentIndex = _initialPage);
          return false;
        }),
        child: _pages[_currentIndex]
      ),
      bottomNavigationBar: GoogleBottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          GoogleBottomNavigationItem(icon: ImageIcon(AssetImage('assets/images/home_icon.png')), text: Text(_titles[0])),
          GoogleBottomNavigationItem(icon: ImageIcon(AssetImage('assets/images/test_icon.png')), text: Text(_titles[1])),
          GoogleBottomNavigationItem(icon: ImageIcon(AssetImage('assets/images/charts_icon.png')), text: Text(_titles[2])),
          GoogleBottomNavigationItem(icon: ImageIcon(AssetImage('assets/images/halo_logo.png')), text: Text(_titles[3])),
          GoogleBottomNavigationItem(icon: ImageIcon(AssetImage('assets/images/settings_icon.png')), text: Text(_titles[4])),
        ],
        onTap: (newIdx){
          if (context.bloc<CountdownBloc>().state is! CountdownPreMeasureState &&
              context.bloc<CountdownBloc>().state is! CountdownMeasureState)
            setState (() => _currentIndex = newIdx);

          if (newIdx == 0 &&
              context.bloc<CountdownBloc>().state is CountdownCompleteState)
            context.bloc<CountdownBloc>().add(CountdownEvents.setToIdle);
        }
      ),
    );
  }
}