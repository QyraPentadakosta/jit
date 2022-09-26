import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../component/snackbar/i_snackbar.dart';
import '../../../repository/services/init_data/model/model_init_data.dart';
import '../../../route/function_route.dart';
import '../services/home_services.dart';
import '../widget/style_card_data.dart';

class HomeController extends ChangeNotifier {
  final HomeServices _homeServices = HomeServices();
  //
  GlobalKey key = GlobalKey();
  double loadingBar = 0;
  ModelInitData initData = ModelInitData();

  bool get mounted => true;

  void addWidth({
    required DragUpdateDetails data,
    required double width,
    required double initContainerData,
    required int index,
  }) {
    double dataWidth = width - 60;
    double initContainer = initContainerData;
    if (initContainer <= dataWidth) {
      if (data.primaryDelta!.isNegative) {
        initData.data?.outletSubs?[index].initContainer =
            (data.primaryDelta!).abs() + initContainer;
      } else {
        if (initContainer >= 10) {
          initData.data?.outletSubs?[index].initContainer =
              initContainer - data.primaryDelta!;
        }
      }
    } else {
      initData.data?.outletSubs?[index].initContainer = initContainer - 2;
      if (initContainer >= 10) {}
      if (initContainer <= dataWidth) {}
    }
    notifyListeners();
  }

  void addWidthOnTap({
    required double width,
    required double isOpen,
    required double initContainerData,
    required int index,
  }) {
    double dataWidth = width - 60;
    if (initData.data?.outletSubs?[index].initContainer != dataWidth) {
      initData.data?.outletSubs?[index].initContainer = dataWidth;
    } else {
      initData.data?.outletSubs?[index].initContainer = 10;
    }
    notifyListeners();
  }

  double changeOpacity({
    required double opacity,
    required int index,
  }) {
    double initContainer =
        initData.data?.outletSubs?[index].initContainer ?? 10;
    var data = opacity / initContainer;
    if (data >= 1.25) {
      return 0.05;
    } else {
      return 0.5;
    }
  }

  List<Widget> getMenuMainPage(BuildContext context) {
    return _homeServices
        .menuHome()
        .map((e) => InkWell(
              onTap: () {
                goToWidget(context, page: e.route);
              },
              child: styleCardScroll(title: e.title, image: e.image),
            ))
        .toList();
  }

  Future getOutlet(BuildContext context) async {
    var resp = await _homeServices.getOutlet(context);
    if (resp != null) {
      initData = resp;
      notifyListeners();
    } else {
      if (mounted) {
        iShowSnackBar(context, title: "Data Outlet Is Empty");
      }
    }
  }

  ScrollController scrollController(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (scrollController.position.pixels.abs() <= 50) {
          loadingBar = scrollController.position.pixels.abs();
        }
      } else {
        loadingBar = 0;
      }
      notifyListeners();
    });
    return scrollController;
  }
}
