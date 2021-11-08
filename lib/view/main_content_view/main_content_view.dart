import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/app_flow/app_flow.dart';
import 'package:teste_tokenlab/view/movies_view/movies_screen.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/about_enterprise_screen.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/favorite_movies_screen.dart';

class MainContentView extends StatefulWidget {
  const MainContentView({Key? key}) : super(key: key);

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
    if(newLocale != _locale){
      _locale = newLocale;
      _appFlowList = <AppFlow>[
        AppFlow(
          S.of(context).mainContentViewBottomNavigationMovies,
          Icons.image_outlined,
          GlobalKey<NavigatorState>(),
        ),
        AppFlow(
          S.of(context).mainContentViewBottomNavigationAboutEnterprise,
          Icons.description,
          GlobalKey<NavigatorState>(),
        ),
        AppFlow(
          S.of(context).mainContentViewBottomNavigationFavoriteMovies,
          Icons.star,
          GlobalKey<NavigatorState>(),
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
          children: _appFlowList.map(
            (appFlow) =>     Navigator(
              key: appFlow.navigatorKey,
              onGenerateRoute: (settings) =>
                  MaterialPageRoute(
                      settings: settings, builder: (context) =>
                  (_currentBarIndex == 0)
                      ? const MoviesScreen()
                      : (_currentBarIndex == 1)
                      ? const AboutEnterpriseScreen()
                      : const FavoriteMoviesScreen(),),
            )
          ).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentBarIndex,
          items: _appFlowList
              .map(
                (flow) =>
                BottomNavigationBarItem(
                  label: flow.title,
                  icon: Icon(flow.iconData),
                ),
          )
              .toList(),
          onTap: (newIndex) =>
              setState(
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
