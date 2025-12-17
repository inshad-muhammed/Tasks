import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/account_selector_provider.dart';

class AccountSelectorField extends ConsumerWidget {
  final String? value;
  final VoidCallback onTap;

  const AccountSelectorField({super.key, this.value, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountSelectorprovider);
    return TextFormField(
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(text: account),
      decoration: InputDecoration(
        labelText: 'Account linked to the alias',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: const Icon(Icons.keyboard_arrow_down),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
