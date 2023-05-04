import 'package:a_flutter_demo/home/provider/home_provider.dart';
import 'package:a_flutter_demo/util/theme_utils.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_deer/goods/page/goods_page.dart';
// import 'package:flutter_deer/home/provider/home_provider.dart';
// import 'package:flutter_deer/order/page/order_page.dart';
// import 'package:flutter_deer/res/resources.dart';
// import 'package:flutter_deer/shop/page/shop_page.dart';
// import 'package:flutter_deer/statistics/page/statistics_page.dart';
// import 'package:flutter_deer/util/theme_utils.dart';
// import 'package:flutter_deer/widgets/double_tap_back_exit_app.dart';
// import 'package:flutter_deer/widgets/load_image.dart';
import 'package:provider/provider.dart';

import '../discoveries/page/home_discoveries.dart';
import '../mine/page/home_mine.dart';
import '../plan/page/home_plan.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../sports/page/home_sports.dart';
import '../widgets/double_tap_back_exit_app.dart';
import '../widgets/load_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with RestorationMixin {
  static const double _imageSize = 22.0;

  late List<Widget> _pageList;
  final List<String> _appBarTitles = ['首页', '计划', '发现', '我的'];
  final PageController _pageController = PageController();

  HomeProvider provider = HomeProvider();

  List<BottomNavigationBarItem>? _list;
  List<BottomNavigationBarItem>? _listDark;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initData() {
    _pageList = [
      const HomeSportsPage(),
      const HomePlanPage(),
      const HomeDiscoveriesPage(),
      const HomeMinePage(),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const tabImages = [
        [
          LoadAssetImage(
            'home/icon_home_n',
            width: _imageSize,
            color: Colours.color_878787,
          ),
          LoadAssetImage(
            'home/icon_home_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_detail_n',
            width: _imageSize,
            color: Colours.color_878787,
          ),
          LoadAssetImage(
            'home/icon_detail_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_eye_n',
            width: _imageSize,
            color: Colours.color_878787,
          ),
          LoadAssetImage(
            'home/icon_eye_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_account_n',
            width: _imageSize,
            color: Colours.color_878787,
          ),
          LoadAssetImage(
            'home/icon_account_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ]
      ];
      _list = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: tabImages[i][0],
          activeIcon: tabImages[i][1],
          label: _appBarTitles[i],
          tooltip: _appBarTitles[i],
        );
      });
    }
    return _list!;
  }

  List<BottomNavigationBarItem> _buildDarkBottomNavigationBarItem() {
    if (_listDark == null) {
      const tabImagesDark = [
        [
          LoadAssetImage('home/icon_home_n', width: _imageSize),
          LoadAssetImage(
            'home/icon_home_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage('home/icon_detail_n', width: _imageSize),
          LoadAssetImage(
            'home/icon_detail_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage('home/icon_eye_n', width: _imageSize),
          LoadAssetImage(
            'home/icon_eye_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ],
        [
          LoadAssetImage('home/icon_account_n', width: _imageSize),
          LoadAssetImage(
            'home/icon_account_n',
            width: _imageSize,
            color: Colours.color_FE7530,
          ),
        ]
      ];

      _listDark = List.generate(tabImagesDark.length, (i) {
        return BottomNavigationBarItem(
          icon: tabImagesDark[i][0],
          activeIcon: tabImagesDark[i][1],
          label: _appBarTitles[i],
          tooltip: _appBarTitles[i],
        );
      });
    }
    return _listDark!;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => provider,
      child: DoubleTapBackExitApp(
        child: Scaffold(
            bottomNavigationBar: Consumer<HomeProvider>(
              builder: (_, provider, __) {
                return BottomNavigationBar(
                  backgroundColor: context.backgroundColor,
                  items: isDark
                      ? _buildDarkBottomNavigationBarItem()
                      : _buildBottomNavigationBarItem(),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: provider.value,
                  elevation: 5.0,
                  iconSize: 21.0,
                  selectedFontSize: Dimens.font_sp10,
                  unselectedFontSize: Dimens.font_sp10,
                  selectedItemColor: Colours.color_FE7530,
                  unselectedItemColor: isDark
                      ? Colours.dark_unselected_item_color
                      : Colours.color_878787,
                  onTap: (index) => _pageController.jumpToPage(index),
                );
              },
            ),
            // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
            body: PageView(
              physics: const NeverScrollableScrollPhysics(), // 禁止滑动
              controller: _pageController,
              onPageChanged: (int index) => provider.value = index,
              children: _pageList,
            )),
      ),
    );
  }

  @override
  String? get restorationId => 'home';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
