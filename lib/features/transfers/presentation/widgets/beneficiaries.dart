import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfers/presentation/widgets/filter_bar_beneficiaries.dart';
import '../providers/beneficiaries_filter_provider.dart';

class BeneficiariesSection extends ConsumerWidget {
  const BeneficiariesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final filtered = ref.watch(filteredBeneficiariesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterBarBeneficiaries(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: DefaultColors.grayD4),
          ),

          child: ListView.separated(
            shrinkWrap: true,
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final beneficiary = filtered[index];
              final name = beneficiary['name'] as String;
              final accNo = beneficiary['acc_no'] as String;
              final bank = beneficiary['bank'] as String;
              final dp = beneficiary['dp'] as String?;
              final Widget avatar;
              if (dp != null && dp.isNotEmpty) {
                avatar = CircleAvatar(
                  radius: screenWidth * 0.064,
                  backgroundImage: NetworkImage(dp),
                );
              } else {
                // Show initials when no image provided
                final initials = name.isNotEmpty
                    ? name
                          .trim()
                          .split(' ')
                          .map((e) => e.isNotEmpty ? e[0] : '')
                          .take(2)
                          .join()
                    : '';
                avatar = CircleAvatar(
                  backgroundColor: DefaultColors.white,
                  radius: screenWidth * 0.064,
                  child: CircleAvatar(
                    radius: screenWidth * 0.06,
                    backgroundColor: DefaultColors.blueLight1,
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: DefaultColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
              return ListTile(
                leading: avatar,
                title: Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accNo,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.grayBase,
                      ),
                    ),
                    Text(
                      bank,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.grayBase,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.more_vert,
                  size: 16,
                  color: DefaultColors.grayBase,
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(height: 1, color: DefaultColors.grayD4),
            ),
          ),
        ),
      ],
    );
  }
}
