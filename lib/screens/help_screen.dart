import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open the link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
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
              ListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                leading: const Icon(Icons.email_outlined),
                title: const Text('Contact Support'),
                subtitle: const Text('Get help with your questions'),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  _openUrl('mailto:support@fluttersensei.com');
                },
              ),
              SizedBox(height: Spacing.sm),

              ListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                leading: const Icon(Icons.language),
                title: const Text('Visit Our Website'),
                subtitle: const Text('Explore more learning resources'),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  _openUrl('https://fluttersensei.com');
                },
              ),
              SizedBox(height: Spacing.sm),

              ListTile(
                tileColor: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Privacy Policy'),
                subtitle: const Text('Learn how your information is handled'),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  _openUrl('https://fluttersensei.com/privacy-policy');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
