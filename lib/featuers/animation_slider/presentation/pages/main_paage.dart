import 'package:flutter/material.dart';

class SlideUpAnimationPage extends StatefulWidget {
  const SlideUpAnimationPage({super.key});

  @override
  State<SlideUpAnimationPage> createState() => _MoreBounceScreenState();
}

class _MoreBounceScreenState extends State<SlideUpAnimationPage>
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
          /// main content
          Positioned.fill(child: Center(child: Text("Main Screen Content"))),

          /// Expanding panel with bounce effect
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500), // slower animation
            curve: Curves.easeOutBack, // smoother soft bounce
            bottom: 0,
            left: 0,
            right: 0,
            height: isExpanded ? height * 0.85 : 140,
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isExpanded = !isExpanded),
                    child: Container(
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 16),
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
                  ),

                  SizedBox(height: 10),

                  Expanded(
                    child: AnimatedOpacity(
                      opacity: isExpanded ? 1 : 0,
                      duration: Duration(milliseconds: 1000), // slower fade
                      curve: Curves.easeOutCubic, // smoother fade
                      child: IgnorePointer(
                        ignoring: !isExpanded,
                        child: ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemCount: 20,
                          separatorBuilder: (_, __) => SizedBox(height: 10),
                          itemBuilder: (_, i) => Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text("Item $i"),
                          ),
                        ),
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
