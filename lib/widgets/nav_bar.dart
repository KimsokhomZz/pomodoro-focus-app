import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_app_project/screens/pomo_timer.dart';
import 'package:get/get.dart'; // Import GetX package

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    // TextStyle customTextStyle = const TextStyle(
    //   fontFamily: 'Zain',
    //   fontWeight: FontWeight.w600,
    //   fontSize: 14,
    //   color: Color(0xffffffff),
    // );

    WidgetStateProperty<TextStyle> labelTextStyle =
        WidgetStateProperty.resolveWith(
      (states) => TextStyle(
        fontFamily: 'Zain',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: states.contains(WidgetState.selected)
            ? const Color(0xff2E8B57) // Selected label color
            : const Color(0xff353935), // Unselected label color,
      ),
    );

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
              navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xffffffff),
            indicatorColor: const Color(0xff2E8B57).withOpacity(0.3),
            labelTextStyle: labelTextStyle,
          )),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.graph_circle,
                  size: 28,
                  color: controller.selectedIndex.value == 0
                      ? const Color(0xff2E8B57) // Selected icon color
                      : const Color(0xff353935), // Unselected icon color
                ),
                label: "Graph",
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.timer,
                  size: 28,
                  color: controller.selectedIndex.value == 1
                      ? const Color(0xff2E8B57) // Selected icon color
                      : const Color(0xff353935), // Unselected icon color
                ),
                label: "Pomo",
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.check_mark_circled,
                  size: 28,
                  color: controller.selectedIndex.value == 2
                      ? const Color(0xff2E8B57) // Selected icon color
                      : const Color(0xff353935), // Unselected icon color
                ),
                label: "Task",
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.settings,
                  size: 28,
                  color: controller.selectedIndex.value == 3
                      ? const Color(0xff2E8B57) // Selected icon color
                      : const Color(0xff353935), // Unselected icon color
                ),
                label: "Setting",
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    Container(color: Colors.amber), // Diagram screen
    const PomoTimerPage(), // Pomo screen
    Container(color: Colors.pink), // Task screen
    Container(color: Colors.blue), // Setting screen
  ];
}
