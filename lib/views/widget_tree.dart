import 'package:flutter/material.dart';
import 'package:flutter_app/data/contants.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/profile_page.dart';
import 'package:flutter_app/views/pages/settings_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter is fun"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkMode.value ^= true;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(Kconstants.themeMode, isDarkMode.value);
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkMode,
              builder: (context, value, child) {
                return Icon(value ? Icons.light_mode : Icons.dark_mode);
              },
            ),
            tooltip: "Change Theme",
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Hope this will show up");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
