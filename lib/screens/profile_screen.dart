import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/form_styles.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    _nameController.text = prefs.getString('profile_name') ?? '';
    _emailController.text = prefs.getString('profile_email') ?? '';
    _phoneController.text = prefs.getString('profile_phone') ?? '';
    _addressController.text = prefs.getString('profile_address') ?? '';
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('profile_name', _nameController.text.trim());
    await prefs.setString('profile_email', _emailController.text.trim());
    await prefs.setString('profile_phone', _phoneController.text.trim());
    await prefs.setString('profile_address', _addressController.text.trim());

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully!')),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

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
                          _nameController.text.trim().isEmpty
                              ? 'Your Name'
                              : _nameController.text.trim(),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: FormStyles.textFieldStyle.copyWith(
                          labelText: 'Name',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Spacing.md),
                      TextFormField(
                        controller: _emailController,
                        decoration: FormStyles.textFieldStyle.copyWith(
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Spacing.md),
                      TextFormField(
                        controller: _phoneController,
                        decoration: FormStyles.textFieldStyle.copyWith(
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Spacing.md),
                      TextFormField(
                        controller: _addressController,
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveProfile();
                            }
                          },
                          icon: Icon(Icons.save),
                          label: const Text('Save Profile'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
