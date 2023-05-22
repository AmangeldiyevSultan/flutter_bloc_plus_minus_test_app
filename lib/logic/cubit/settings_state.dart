part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotification;
  final bool emailNotification;

  const SettingsState({
    required this.appNotification,
    required this.emailNotification,
  });

  @override
  List<Object> get props => [appNotification, emailNotification];

  SettingsState copyWith({
    bool? appNotification,
    bool? emailNotification,
  }) {
    return SettingsState(
      appNotification: appNotification ?? this.appNotification,
      emailNotification: emailNotification ?? this.emailNotification,
    );
  }

  @override
  bool get stringify => true;
}
