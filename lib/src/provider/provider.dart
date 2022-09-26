import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../pages/menu/out/controller/out_controller.dart';
import 'controller/outlet_controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => OutletController(),
  ),
];
