import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_app/views/pages/expanded_flexible.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "e1";

  var battery = Battery();
  int percentage = 0;

  @override
  void initState() {
    super.initState();
    getBatteryPercentage();
  }

  void getBatteryPercentage() async {
    final level = await battery.batteryLevel;
    percentage = level;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed:
                    () => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset("assets/images/background.jpg"),
                          ),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                      ),
                    },
                child: Text("Open SnackBar"),
              ),
              Divider(color: Colors.teal, thickness: 3, endIndent: 100),
              ElevatedButton(
                onPressed:
                    () => {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            content: Text("Battery below $percentage%"),
                            icon: Icon(Icons.battery_alert_outlined),
                            title: Text("Alert"),
                            actions: [
                              FilledButton(
                                onPressed: () => {Navigator.pop(context)},
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      ),
                    },
                child: Text("Show Dialog"),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: "e1", child: Text("Element 1")),
                  DropdownMenuItem(value: "e2", child: Text("Element 2")),
                  DropdownMenuItem(value: "e3", child: Text("Element 3")),
                  DropdownMenuItem(value: "e4", child: Text("Element 4")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () => {setState(() {})},
              ),
              Text(controller.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChecked,
                onChanged:
                    (bool? value) => {
                      setState(() {
                        isChecked = value;
                      }),
                    },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                value: isChecked,
                onChanged:
                    (bool? value) => setState(() {
                      isChecked = value;
                    }),
                title: Text("This is a title"),
              ),
              SwitchListTile.adaptive(
                title: Text("Switch Me"),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                value: sliderValue,
                max: 10,
                divisions: 10,
                onChanged:
                    (double value) => setState(() {
                      sliderValue = value;
                    }),
              ),
              GestureDetector(
                onTap: () => {print("image selected")},
                child: Image.asset("assets/images/background.jpg"),
              ),
              InkWell(
                splashColor: Colors.tealAccent,
                onTap: () => {print("grey area selected")},
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white38,
                ),
              ),
              FilledButton(onPressed: () => {}, child: Text("Click me")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExpandedFlexiblePage();
                      },
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                ),
                child: Text("Take me too flexibe and expanded page"),
              ),
              TextButton(onPressed: () {}, child: Text("Click Me")),
              OutlinedButton.icon(
                onPressed: () {},
                label: Text("Click me"),
                icon: Icon(Icons.calendar_today_rounded),
              ),
              CloseButton(onPressed: () {}),
              BackButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
