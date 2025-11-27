import 'package:flutter_riverpod/legacy.dart';

//0 = InitialContent
//1 = ActivateVisibility = AccountSelectionContent
//2 = DeactivateVisibility = DeactivateVisibilityContent
//3 = Next Content (after account selection continue)
//4 = Enable visibility state screen
final contentStepProvider = StateProvider<int>((ref) => 0);
