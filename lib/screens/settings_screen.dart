import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _soundEffects = true;
  bool _vibration = true;

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      _darkMode = prefs.getBool('dark_mode') ?? false;
      _notifications = prefs.getBool('notifications') ?? true;
      _soundEffects = prefs.getBool('sound_effects') ?? true;
      _vibration = prefs.getBool('vibration') ?? true;
    });
  }

  Future<void> _saveSetting(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: ListView(
            children: [
              Text('Appearance', style: theme.textTheme.labelLarge),
              SizedBox(height: Spacing.md),

              SwitchListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                title: const Text('Dark Mode'),
                subtitle: const Text('Use a darker appearance'),
                value: _darkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                  });
                  _saveSetting('dark_mode', value);
                },
              ),

              SizedBox(height: Spacing.lg),

              Text('Preferences', style: theme.textTheme.labelLarge),
              SizedBox(height: Spacing.md),

              SizedBox(height: Spacing.md),
              SwitchListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                title: const Text('Notifications'),
                subtitle: const Text('Manage notification preferences'),
                value: _notifications,
                onChanged: (value) {
                  setState(() {
                    _notifications = value;
                  });
                  _saveSetting('notifications', value);
                },
              ),

              SizedBox(height: Spacing.sm),
              SwitchListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                title: const Text('Sound Effects'),
                subtitle: const Text('Enable or disable sound effects'),
                value: _soundEffects,
                onChanged: (value) {
                  setState(() {
                    _soundEffects = value;
                  });
                  _saveSetting('sound_effects', value);
                },
              ),

              SizedBox(height: Spacing.sm),
              SwitchListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                title: const Text('Vibration'),
                subtitle: const Text('Enable or disable vibration feedback'),
                value: _vibration,
                onChanged: (value) {
                  setState(() {
                    _vibration = value;
                  });
                  _saveSetting('vibration', value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
