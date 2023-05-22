import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/logic/cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
        final notificationSnackBar = SnackBar(
          duration: const Duration(milliseconds: 300),
          content: Text(
              'App: ${state.appNotification}\nEmail:${state.emailNotification}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
      }, child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                value: state.appNotification,
                onChanged: (toggleNotificationBool) {
                  context
                      .read<SettingsCubit>()
                      .toggleAppNotification(toggleNotificationBool);
                },
                title: const Text('App Notifications'),
              ),
              SwitchListTile(
                value: state.emailNotification,
                onChanged: (toggleNotificationBool) {
                  context
                      .read<SettingsCubit>()
                      .toggleEmailNotification(toggleNotificationBool);
                },
                title: const Text('Email Notifications'),
              ),
            ],
          );
        },
      )),
    );
  }
}
