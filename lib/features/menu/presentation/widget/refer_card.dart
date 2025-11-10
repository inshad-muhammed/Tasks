import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class ReferCard extends StatelessWidget {
  const ReferCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenWidth * 0.3,

      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.04),
        gradient: LinearGradient(
          stops: [0, 8],
          begin: AlignmentGeometry.centerLeft,
          end: AlignmentGeometry.centerRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/refercard.png",
                height: SizeConfig.screenWidth * 0.3,
                fit: BoxFit.cover,
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenWidth * 0.01,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Refer and Earn",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.screenWidth * 0.036,
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.screenWidth * 0.36,
                    child: Text(
                      "Exclusive Benefits Awaits You!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.screenWidth * 0.028,
                      ),
                    ),
                  ),
                  // SizedBox(height: SizeConfig.screenWidth * 0.01),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(
                          SizeConfig.screenWidth * 0.01,
                          SizeConfig.screenWidth * 0.07,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Apply Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * 0.025,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
