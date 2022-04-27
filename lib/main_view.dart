import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/navigation/router.gr.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        Home(),
        Cart(),
        Profile(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: kElevationToShadow[3],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.red,
                  ),
                  icon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    size: 25,
                    color: Colors.red,
                  ),
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.red,
                  ),
                  icon: Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
