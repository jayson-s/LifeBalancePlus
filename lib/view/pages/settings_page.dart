import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Profile Information'),
            onTap: () {
              // Navigate to profile settings
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileSettingsPage()));
            },
          ),
          ListTile(
            title: Text('Units and Preferences'),
            onTap: () {
              // Navigate to units and preferences settings
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UnitsAndPreferencesSettingsPage()));
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notifications settings
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsSettingsPage()));
            },
          ),
          ListTile(
            title: Text('Goal Settings'),
            onTap: () {
              // Navigate to goal settings
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoalSettingsPage()));
            },
          ),
          ListTile(
            title: Text('Connectivity'),
            onTap: () {
              // Navigate to connectivity settings
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConnectivitySettingsPage()));
            },
          ),
          ListTile(
            title: Text('Data Management'),
            onTap: () {
              // Navigate to data management settings
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataManagementSettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  // Define variables to store user profile information.
  String? username = 'John Doe';
  int? age = 30;
  String? gender;
  double? weight = 70.0;
  double? height = 175.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
              controller: TextEditingController(text: username),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text('Age'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your age',
              ),
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: age?.toString() ?? ''),
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value);
                });
              },
            ),
            SizedBox(height: 20.0),
            Text('Gender'),
            DropdownButton<String?>(
              value: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
              items: <String?>['Male', 'Female', 'Other']
                  .map((value) => DropdownMenuItem<String?>(
                        value: value,
                        child: Text(value ?? 'Select Gender'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Text('Weight (kg)'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your weight',
              ),
              keyboardType: TextInputType.number,
              controller:
                  TextEditingController(text: weight?.toStringAsFixed(1) ?? ''),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 20.0),
            Text('Height (cm)'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your height',
              ),
              keyboardType: TextInputType.number,
              controller:
                  TextEditingController(text: height?.toStringAsFixed(1) ?? ''),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save the updated profile information to the server or storage here.
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitsAndPreferencesSettingsPage extends StatefulWidget {
  @override
  _UnitsAndPreferencesSettingsPageState createState() =>
      _UnitsAndPreferencesSettingsPageState();
}

enum UnitsSystem { Metric, Imperial }

class _UnitsAndPreferencesSettingsPageState
    extends State<UnitsAndPreferencesSettingsPage> {
  UnitsSystem unitsSystem = UnitsSystem.Metric;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Units and Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Units System'),
            ListTile(
              title: Text('Metric System'),
              leading: Radio(
                value: UnitsSystem.Metric,
                groupValue: unitsSystem,
                onChanged: (UnitsSystem? value) {
                  setState(() {
                    unitsSystem = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Imperial System'),
              leading: Radio(
                value: UnitsSystem.Imperial,
                groupValue: unitsSystem,
                onChanged: (UnitsSystem? value) {
                  setState(() {
                    unitsSystem = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsSettingsPage extends StatefulWidget {
  @override
  _NotificationsSettingsPageState createState() =>
      _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  bool? enableNotifications = true;
  bool? enableSound = true;
  bool? enableVibration = true;
  TimeOfDay notificationTime = TimeOfDay(hour: 8, minute: 0);
  int reminderFrequency = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enable Notifications'),
            CheckboxListTile(
              title: Text('Enable notifications'),
              value: enableNotifications,
              onChanged: (value) {
                setState(() {
                  enableNotifications = value;
                });
              },
            ),
            Divider(),
            Text('Notification Preferences'),
            CheckboxListTile(
              title: Text('Enable Sound'),
              value: enableSound,
              onChanged: (value) {
                setState(() {
                  enableSound = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Enable Vibration'),
              value: enableVibration,
              onChanged: (value) {
                setState(() {
                  enableVibration = value;
                });
              },
            ),
            Divider(),
            Text('Reminder Frequency'),
            ListTile(
              title: Text('$reminderFrequency times a day'),
              onTap: () async {
                final newFrequency = await showDialog<int>(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Select Reminder Frequency'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 1);
                          },
                          child: Text('1 time a day'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 2);
                          },
                          child: Text('2 times a day'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 3);
                          },
                          child: Text('3 times a day'),
                        ),
                        // Add more options as needed.
                      ],
                    );
                  },
                );

                if (newFrequency != null) {
                  setState(() {
                    reminderFrequency = newFrequency;
                  });
                }
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save the updated notification settings to the server or storage here.
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalSettingsPage extends StatefulWidget {
  @override
  _GoalSettingsPageState createState() => _GoalSettingsPageState();
}

class _GoalSettingsPageState extends State<GoalSettingsPage> {
  int dailyGoal = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Goal'),
            Slider(
              value: dailyGoal.toDouble(),
              onChanged: (value) {
                setState(() {
                  dailyGoal = value.round();
                });
              },
              min: 0,
              max: 5000,
              divisions: 100,
              label: dailyGoal.toString(),
            ),
            SizedBox(height: 10.0),
            Text('Daily Goal Amount: $dailyGoal'),
            ElevatedButton(
              onPressed: () {
                // Save the updated goal settings to the server or storage here.
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectivitySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Settings'),
      ),
      body: Center(
        child: Text('Connectivity settings go here'),
      ),
    );
  }
}

class DataManagementSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Management Settings'),
      ),
      body: Center(
        child: Text('Data management settings go here'),
      ),
    );
  }
}
