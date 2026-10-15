import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';

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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
