import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class BiometricBottomSheet extends StatelessWidget {
  const BiometricBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.03,
                      // vertical: SizeConfig.screenWidth * 0.03,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.06),
                        Image.asset("assets/fingerprint.png"),
                        Text(
                          "Enable Biometric Login ?",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.screenWidth * 0.054,
                            color: Color(0xff0D3E7F),
                          ),
                        ),
                        Text(
                          "Setup your biometric to login easily",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.screenWidth * 0.036,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.04),
                        SizedBox(
                          width: double.infinity,
                          height: SizeConfig.screenWidth * 0.12,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff0D3E7F),
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Enable Biometric Login",
                              style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.036,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: SizeConfig.screenHeight * 0.01),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Setup Later in Settings",
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth * 0.036,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0D3E7F),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.06),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text("Bottom Sheet"),
        ),
      ),
    );
  }
}
