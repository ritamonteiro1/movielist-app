import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/app_flow/app_flow.dart';
import 'package:teste_tokenlab/view/movies_view/movies_view.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/about_enterprise_view_widget.dart';

class MainContentView extends StatefulWidget {
  const MainContentView({Key? key}) : super(key: key);

  @override
  _MainContentViewState createState() => _MainContentViewState();
}

class _MainContentViewState extends State<MainContentView> {

  var _currentBarIndex = 0;
  final appFlowList = <AppFlow>[
    AppFlow(
      'Filmes',
      Icons.image_outlined,
      GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      'Sobre a empresa',
      Icons.description,
      GlobalKey<NavigatorState>(),
    )
  ];


  @override
  Widget build(BuildContext context) {
    final currentFlow = appFlowList[_currentBarIndex];
    return WillPopScope(
      onWillPop: () async =>
      !await currentFlow.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentBarIndex,
          children: appFlowList.map(
            (appFlow) =>     Navigator(
              key: appFlow.navigatorKey,
              onGenerateRoute: (settings) =>
                  MaterialPageRoute(
                      settings: settings, builder: (context) =>
                  (_currentBarIndex == 0)
                      ? const MoviesView()
                      : const AboutEnterpriseView()),
            )
          ).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentBarIndex,
          items: appFlowList
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
