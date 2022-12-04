class WalletStrings {
  static WalletStrings? _instance;
  static WalletStrings get instance {
    _instance ??= WalletStrings._init();
    return _instance!;
  }

  WalletStrings._init();

  final String nameValidatorString = 'mockmockmockmock321';
}
