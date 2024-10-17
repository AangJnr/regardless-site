import 'package:regardless_site/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:regardless_site/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:regardless_site/ui/views/home/home_view.dart';
import 'package:regardless_site/ui/views/section_contact_us/section_contact_us_view.dart';
import 'package:regardless_site/ui/views/training_services/section_sessions_info_view.dart';
import 'package:regardless_site/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:regardless_site/ui/views/section_download_app/section_download_app_view.dart';
import 'package:regardless_site/ui/views/shop/shop_view.dart';
import 'package:regardless_site/ui/views/terms/terms_view.dart';
import 'package:regardless_site/ui/views/faq/faq_view.dart';

import '../ui/common/app_strings.dart';
import 'services/toast_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, initial: true),
    CustomRoute(page: TermsView, path: '/$terms', name: 'terms'),
    CustomRoute(page: TermsView, path: '/$policy', name: 'policy'),
    CustomRoute(page: FaqView, path: '/$faq'),
    CustomRoute(page: SectionSessionsInfoView, path: '/$trainingServices'),
    CustomRoute(page: ShopView, path: '/$shop'),
    CustomRoute(page: SectionDownloadAppView, path: '/$mobileApp'),
    CustomRoute(page: SectionContactUsView, path: '/$contact'),

    // @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    Singleton(classType: SectionDownloadAppView),

    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: ToastService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
