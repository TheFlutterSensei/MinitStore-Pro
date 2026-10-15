import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/form_styles.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 320,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(Radii.xl),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/id/64/300/300',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 255,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Alex Morgan',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: FormStyles.textFieldStyle.copyWith(
                        labelText: 'Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: Spacing.md),
                    TextField(
                      decoration: FormStyles.textFieldStyle.copyWith(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Spacing.md),
                    TextField(
                      decoration: FormStyles.textFieldStyle.copyWith(
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: Spacing.md),
                    TextField(
                      decoration: FormStyles.textFieldStyle.copyWith(
                        labelText: 'Address',
                        alignLabelWithHint: true,
                      ),
                      keyboardType: TextInputType.phone,
                      maxLines: 3,
                    ),
                    SizedBox(height: Spacing.md),
                    SizedBox(
                      height: 60,
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.save),
                        label: const Text('Save Profile'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
