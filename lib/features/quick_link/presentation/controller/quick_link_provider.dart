import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/quick_link/data/models/quick_link_model.dart';
import 'package:tasks/features/quick_link/data/services/quick_link_service.dart';

final quickLinkServiceProvider = Provider((ref) => QuickLinkService());
final quickLinksProvider = FutureProvider<List<QuickLinkModel>>((ref) async {
  final service = ref.read(quickLinkServiceProvider);
  return service.fetchQuickLinks();
});
