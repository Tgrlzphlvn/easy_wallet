import 'package:easy_wallet_v2/feature/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderController {
  static ProviderController? _instance;
  static ProviderController get instance {
    _instance ??= ProviderController._init();
    return _instance!;
  }

  ProviderController._init();

  List<SingleChildWidget> get providers => _providers;

  final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
  ];
}
