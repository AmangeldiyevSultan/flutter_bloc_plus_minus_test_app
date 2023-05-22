import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
          appNotification: false,
          emailNotification: false,
        ));

  void toggleAppNotification(bool toggleNotificationBool) =>
      emit(state.copyWith(appNotification: toggleNotificationBool));

  void toggleEmailNotification(bool toggleNotificationBool) =>
      emit(state.copyWith(emailNotification: toggleNotificationBool));
}
