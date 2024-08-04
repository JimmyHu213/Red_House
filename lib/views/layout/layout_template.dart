import 'package:flutter/material.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/router/router.dart';
import 'package:red_house/services/navigation_service.dart';
import 'package:red_house/views/about/about_view.dart';
import 'package:red_house/views/home/home_view.dart';
import 'package:red_house/views/location/location_view.dart';
import 'package:red_house/views/service/service_view.dart';
import 'package:red_house/views/special/special_view.dart';
import 'package:red_house/widgets/centered_view/centered_view.dart';
import 'package:red_house/widgets/navigation_drawer/nav_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:red_house/widgets/navigation_bar/navigation_bar.dart' as navbar;

class LayoutTemplate extends StatefulWidget {
  const LayoutTemplate({super.key});

  @override
  State<LayoutTemplate> createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavDrawer(
                onItemTap: (indext) {
                  scrollToSection(indext);
                  Navigator.pop(context);
                },
              )
            : null,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CenteredView(
            child: Column(
              children: <Widget>[
                const navbar.NavigationBar(),
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              HomeViewPage(
                                key: _sectionKeys[0],
                              ),
                              SpecialView(
                                key: _sectionKeys[1],
                              ),
                              ServiceView(key: _sectionKeys[2]),
                              LocationView(
                                key: _sectionKeys[3],
                              ),
                              AboutView(
                                key: _sectionKeys[4],
                              )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Navigator(
                          key: locator<NavigationService>().navigatorKey,
                          onGenerateRoute: generateRoute,
                          initialRoute: HomeRoute,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final context = _sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
