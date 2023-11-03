import 'package:auto_route/auto_route.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/generated/l10n.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomePageRoute(),
        CategoryPageRoute(),
        ArticlePageRoute(),
        CartPageRoute(),
        ProfilePageRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              enableFeedback: true,
              elevation: 0,
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.amber[700],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  label: S.of(context).home,
                  activeIcon: Icon(
                    Icons.home_filled,
                    size: 28,
                  ),
                  icon: Icon(Icons.home_filled, size: 24),
                ),
                BottomNavigationBarItem(
                  label: S.of(context).category,
                  activeIcon: Icon(
                    Icons.dashboard_rounded,
                    size: 28,
                  ),
                  icon: Icon(
                    Icons.dashboard_outlined,
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  activeIcon: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[700],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Icon(
                      Icons.family_restroom,
                      color: Colors.white,
                      size: 30,
                    ).padded(17),
                  ),
                  icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Icon(Icons.family_restroom_outlined).padded(20),
                  ),
                ),
                BottomNavigationBarItem(
                  label: S.of(context).bag,
                  activeIcon: Icon(
                    Icons.shopping_bag_rounded,
                    size: 28,
                  ),
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  label: S.of(context).sign_in,
                  icon: Icon(
                    Icons.account_circle_outlined,
                    size: 24,
                  ),
                  activeIcon: Icon(
                    Icons.account_circle_rounded,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
