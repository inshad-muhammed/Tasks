import 'package:flutter/material.dart';

class SlideUpAnimationPage extends StatefulWidget {
  const SlideUpAnimationPage({super.key});

  @override
  State<SlideUpAnimationPage> createState() => _SlideUpAnimationPageState();
}

class _SlideUpAnimationPageState extends State<SlideUpAnimationPage>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Appbar"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() => isExpanded = !isExpanded);
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Positioned.fill(child: Center(child: Text("Main Screen Content"))),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeOutBack,
            bottom: 0,
            left: 0,
            right: 0,
            height: isExpanded ? height * 0.85 : 140,
            child: AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              child: IgnorePointer(
                ignoring: !isExpanded,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  // Show main item when isExpanded is false
                  // Show full listwhen isExpanded is true
                  itemCount: isExpanded ? 21 : 1,
                  separatorBuilder: (_, __) => SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    if (i == 0) {
                      //Main item
                      return GestureDetector(
                        onTap: () => setState(() => isExpanded = !isExpanded),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 15,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Main Item",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      );
                    }

                    //other list items
                    return Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Item ${i - 1}"),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
