import 'package:flutter_riverpod/legacy.dart';

//0 = InitialContent
// 1 = ActivateVisibility = AccountSelectionContent
// 2 = DeactivateVisibility = DeactivateVisibilityContent
// 3 = Next Content (after account selection continue)
final contentStepProvider = StateProvider<int>((ref) => 0);
