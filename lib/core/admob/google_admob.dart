// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class WalletGoogleAdMob extends ChangeNotifier {
//   bool staticAdLoaded = false;
//   bool inlineAdLoaded = false;

//   late BannerAd staticAd;
//   late BannerAd inlineAd;

//   static const AdRequest request = AdRequest();

//   void loadStaticBannerAd() {
//     staticAd = BannerAd(
//         adUnitId: 'ca-app-pub-3940256099942544/6300978111',
//         size: AdSize.banner,
//         request: request,
//         listener: BannerAdListener(
//           onAdLoaded: (ad) {
//             staticAdLoaded = true;
//             notifyListeners();
//           },
//           onAdFailedToLoad: (ad, error) {
//             ad.dispose();
//             debugPrint('admob error: $error');
//           },
//         ));
//     staticAd.load();
//   }

//   void loadinLineBannerAd() {
//     inlineAd = BannerAd(
//         adUnitId: 'ca-app-pub-3940256099942544/6300978111',
//         size: AdSize.banner,
//         request: request,
//         listener: BannerAdListener(
//           onAdLoaded: (ad) {
//             inlineAdLoaded = true;
//             notifyListeners();
//           },
//           onAdFailedToLoad: (ad, error) {
//             ad.dispose();
//             debugPrint('admob error: $error');
//           },
//         ));
//     inlineAd.load();
//   }
// }
