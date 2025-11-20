import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfers/presentation/widgets/filter_bar_beneficiaries.dart';
import '../../domain/models/beneficiary.dart';
import '../providers/beneficiaries_filter_provider.dart';

class BeneficiariesSection extends ConsumerWidget {
  const BeneficiariesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSelected = ref.watch(selectedFilterProviderBeneficiaries);
    final filtered = ref.watch(filteredBeneficiariesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterBarBeneficiaries(),
        SizedBox(height: screenHeight * 0.018),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            border: Border.all(color: DefaultColors.grayD4),
          ),

          child: ListView.separated(
            shrinkWrap: true,
            itemCount: isSelected == null ? 4 : filtered.length,
            itemBuilder: (context, index) {
              final Beneficiary beneficiary = filtered[index];
              final name = beneficiary.name;
              final accNo = beneficiary.id;
              final bank = beneficiary.bank;
              final avatarUrl = beneficiary.avatarUrl;
              final localImage = beneficiary.localImage;

              final Widget avatar;
              if (avatarUrl != null && avatarUrl.isNotEmpty) {
                avatar = CircleAvatar(
                  radius: screenWidth * 0.064,
                  backgroundImage: NetworkImage(avatarUrl),
                );
              } else if (localImage != null && localImage.isNotEmpty) {
                avatar = CircleAvatar(
                  radius: screenWidth * 0.064,
                  backgroundImage: AssetImage(localImage),
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: const Divider(height: 1, color: DefaultColors.grayD4),
            ),
          ),
        ),
      ],
    );
  }
}
