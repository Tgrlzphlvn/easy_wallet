import 'package:easy_wallet_v2/feature/viewmodel/add_account_page_view_model.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_income_or_expense_view_model.dart.dart';
import 'package:easy_wallet_v2/feature/viewmodel/add_shopping_list_view_model.dart';
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
      create: (context) => HomeViewModel()
        ..getAccounts()
        ..getIncomes(),
    ),
    ChangeNotifierProvider<AddAccountPageViewModel>(
      create: (context) => AddAccountPageViewModel(),
    ),
    ChangeNotifierProvider<AddIncomeOrExpenseViewModel>(
      create: (context) => AddIncomeOrExpenseViewModel(),
    ),
    ChangeNotifierProvider<AddShoppingListViewModel>(
      create: (context) => AddShoppingListViewModel()..getShoppingLists(),
    )
  ];
}
