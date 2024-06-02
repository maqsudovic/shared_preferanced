import 'package:flutter/material.dart';
import 'package:shared_preferanced/controller/appchanger_controller.dart';
import 'package:shared_preferanced/model/appchanger_model.dart';

class Homepage extends StatefulWidget {
  final SettingsController controller;

  const Homepage({Key? key, required this.controller}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Settings _settings;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _settings = await widget.controller.getSettings();
    setState(() {});
  }

  void _saveSettings() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Switch(
              value: _settings.isNightMode,
              onChanged: (value) => setState(() => _settings.isNightMode = value),
            ),
            // Add widgets for color pickers, text size slider, etc.
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
