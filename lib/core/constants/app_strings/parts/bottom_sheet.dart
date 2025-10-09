import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

extension BottomSheetString on DefaultStrings {
  String get title =>
      get(I18nKeys().title, fallback: "Enable Biometric Login ?");
  String get description => get(
    I18nKeys().description,
    fallback: "Setup your biometric to login easily",
  );
  String get setupButtonText =>
      get(I18nKeys().setupButtonText, fallback: "Enable Biometric Login");
  String get setupLaterButtonText =>
      get(I18nKeys().setupLaterButtonText, fallback: "Setup Later in Settings");
}
