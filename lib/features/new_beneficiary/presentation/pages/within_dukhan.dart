import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/new_beneficiary/presentation/widgets/image_picker_function.dart';
import '../controllers/add_beneficiary_providers.dart';
import 'package:tasks/features/new_beneficiary/presentation/widgets/info_text.dart';
import 'package:tasks/features/new_beneficiary/presentation/widgets/succes_bottomsheet.dart';
import '../../../../core/constants/colors.dart';

class AddBeneficiaryPage extends ConsumerWidget {
  const AddBeneficiaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountNumber = ref.watch(accountNumberProvider);
    final isVerified = ref.watch(isVerifiedProvider);
    final showFullProfile = ref.watch(showFullProfileProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final showVerifyButton = accountNumber.length == 12;

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: DefaultColors.blueT1,
      appBar: AppBar(
        backgroundColor: DefaultColors.blueT1,
        foregroundColor: DefaultColors.white,
        title: const Text("New Beneficiary"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!showFullProfile)
                Text(
                  "For transfer within Dukhan",
                  style: TextStyle(
                    color: DefaultColors.blackT,
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              SizedBox(height: screenHeight * 0.026),
              //Main Field(hide after proceed)
              if (!showFullProfile)
                TextField(
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Account Number / IBAN",
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) =>
                      ref.read(accountNumberProvider.notifier).state = value,
                ),

              const SizedBox(height: 16),

              // Verified → show details
              if (isVerified && !showFullProfile) ...[
                _buildDisabledField("Beneficiary Name", "MD. Ahtiyat", false),
                const SizedBox(height: 12),
                _buildDisabledField("Account Currency", "QAR", false),
                const SizedBox(height: 16),
              ],

              if (showFullProfile) _buildFullProfileSection(context, ref),

              const Spacer(),

              if (isVerified && !showFullProfile)
                InfoText(
                  message:
                      "Notes: <Bank to provide copy non-verifiable bank details.> ",
                ),
              if (!showFullProfile) const SizedBox(height: 16),
              if (showVerifyButton)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!isVerified) {
                        ref.read(isVerifiedProvider.notifier).state = true;
                      } else if (!showFullProfile) {
                        ref.read(showFullProfileProvider.notifier).state = true;
                      } else {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (_) => SuccesBottomsheet(),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColors.blueT1,
                      foregroundColor: DefaultColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      !isVerified
                          ? "Verify"
                          : !showFullProfile
                          ? "Proceed"
                          : "Save",
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullProfileSection(BuildContext context, WidgetRef ref) {
    final accountNumber = ref.watch(accountNumberProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        EditableAvatar(),

        const SizedBox(height: 20),

        Text(
          "Ahtiyat Yalik",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "JFDU293890180184304180101",
          style: TextStyle(color: Colors.grey),
        ),
        const Text("Doha Bank", style: TextStyle(color: Colors.grey)),

        const SizedBox(height: 20),

        // Nickname Editable
        TextField(
          decoration: InputDecoration(
            labelText: "Nickname",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (value) =>
              ref.read(nicknameProvider.notifier).state = value,
        ),

        const SizedBox(height: 16),

        _buildDisabledField("Account Number", accountNumber, true),
        const SizedBox(height: 12),
        _buildDisabledField("Beneficiary Name", "MD. Ahtiyat", false),
        const SizedBox(height: 12),
        _buildDisabledField("Account Currency", "QAR", false),
      ],
    );
  }

  Widget _buildDisabledField(String label, String value, bool isAccNo) {
    return TextField(
      enabled: false,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade200,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        suffixIcon: !isAccNo
            ? const Icon(Icons.check_circle, color: Colors.green)
            : null,
      ),
    );
  }
}
