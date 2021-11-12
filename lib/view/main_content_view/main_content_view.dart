import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/app_flow/app_flow.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class MainContentView extends StatefulWidget {
  const MainContentView({
    Key? key,
  }) : super(key: key);

  @override
  _MainContentViewState createState() => _MainContentViewState();
}

class _MainContentViewState extends State<MainContentView> {
  Locale? _locale;
  late List<AppFlow> _appFlowList;
  var _currentBarIndex = 0;

  @override
  void didChangeDependencies() {
    final newLocale = Localizations.localeOf(context);
    if (newLocale != _locale) {
      _locale = newLocale;
      _appFlowList = <AppFlow>[
        AppFlow(
          S.of(context).mainContentViewBottomNavigationMovies,
          Icons.image_outlined,
          GlobalKey<NavigatorState>(),
          'movies',
        ),
        AppFlow(
          S.of(context).mainContentViewBottomNavigationAboutEnterprise,
          Icons.description,
          GlobalKey<NavigatorState>(),
          'about-enterprise',
        ),
        AppFlow(
          S.of(context).mainContentViewBottomNavigationFavoriteMovies,
          Icons.star,
          GlobalKey<NavigatorState>(),
          'favorites-movie',
        )
      ];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final currentFlow = _appFlowList[_currentBarIndex];
    return WillPopScope(
      onWillPop: () async =>
          !await currentFlow.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentBarIndex,
          children: _appFlowList
              .map((appFlow) => Navigator(
                  initialRoute: appFlow.routeName,
                  key: appFlow.navigatorKey,
                  onGenerateRoute: (settings) => FluroRouter.appRouter
                      .matchRoute(context, settings.name,
                          routeSettings: settings)
                      .route))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentBarIndex,
          items: _appFlowList
              .map(
                (flow) => BottomNavigationBarItem(
                  label: flow.title,
                  icon: Icon(flow.iconData),
                ),
              )
              .toList(),
          onTap: (newIndex) => setState(
            () {
              if (_currentBarIndex != newIndex) {
                _currentBarIndex = newIndex;
              } else {
                currentFlow.navigatorKey.currentState!
                    .popUntil((route) => route.isFirst);
              }
            },
          ),
        ),
      ),
    );
  }
}
