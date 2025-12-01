import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfers/presentation/constants/beneficiaries_static_data.dart';
import 'package:tasks/features/transfers/presentation/widgets/beneficiary_tile.dart';
import 'package:tasks/features/transfers/presentation/widgets/empty_state_widgets/empty_transactions_card.dart';
import '../../domain/models/beneficiary.dart';

class BeneficiariesSection extends ConsumerWidget {
  const BeneficiariesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Flatten map into a list
    final List<Beneficiary> allBeneficiaries = beneficiariesStatic.values
        .expand((list) => list)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        allBeneficiaries.isEmpty
            ? BeneficariesCard()
            : Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.028),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final beneficiary = allBeneficiaries[index];
                      return BeneficiaryTile(beneficiary: beneficiary);
                    },
                    separatorBuilder: (context, index) =>
                        Divider(color: DefaultColors.grayTB.withAlpha(51)),
                  ),
                ),
              ),
      ],
    );
  }
}
