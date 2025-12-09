class AppAsset {
  static final AppAssetSvg svgs = AppAssetSvg();
  static final AppAssetImages images = AppAssetImages();
}

class AppAssetSvg {
  static const String _svgsPath = 'assets/svgs/';
  static const String _ext = '.svg';

  String arrowLeftBlack = '${_svgsPath}arrow_head_left_black$_ext';
  String arrowLeftWhite = '${_svgsPath}arrow_head_left_white$_ext';
  String bellLightGray = '${_svgsPath}bell_light_gray$_ext';
  String calendarDarkGray = '${_svgsPath}calendar_dark_gray$_ext';
  String clockDarkGray = '${_svgsPath}clock_dark_gray$_ext';
  String clockPrimary = '${_svgsPath}clock_primary$_ext';
  String cautionWhite = '${_svgsPath}caution_white$_ext';
  String calendarSharpBlack = '${_svgsPath}calendar_sharp_black$_ext';
  String calendarSharpGray = '${_svgsPath}calendar_sharp_gray$_ext';
  String calendarPrimary = '${_svgsPath}calendar_primary$_ext';
  String cameraIcon = '${_svgsPath}camera_icon$_ext';
  String deleteDanger = '${_svgsPath}delete_danger$_ext';
  String dollarCoinLightGray = '${_svgsPath}dollar_coin_light_gray$_ext';
  String exclamationMarkPrimary = '${_svgsPath}exclamation_mark_primary$_ext';
  String editPrimary = '${_svgsPath}edit_primary$_ext';
  String editInfo = '${_svgsPath}edit_info$_ext';
  String imageIcon = '${_svgsPath}image_icon$_ext';
  String infoWhite = '${_svgsPath}info_white$_ext';
  String locationPinDarkGray = '${_svgsPath}location_pin_dark_gray$_ext';
  String lockLightGray = '${_svgsPath}lock_light_gray$_ext';
  String logoutWhite = '${_svgsPath}logout_white$_ext';
  String moneyPrimary = '${_svgsPath}money_primary$_ext';
  String moneyWhite = '${_svgsPath}money_white$_ext';
  String morePrimary = '${_svgsPath}more_primary$_ext';
  String notificationBlack = '${_svgsPath}notification_black$_ext';
  String pinLocationPrimary = '${_svgsPath}pin_location_primary$_ext';
  String pinLocationGray = '${_svgsPath}pin_location_gray$_ext';
  String profileGray = '${_svgsPath}profile_gray$_ext';
  String searchGray = '${_svgsPath}search_gray$_ext';
  String reportGray = '${_svgsPath}report_gray$_ext';
  String suitcasePrimary = '${_svgsPath}suitcase_primary$_ext';
  String tickWhite = '${_svgsPath}tick_white$_ext';
  String userPrimary = '${_svgsPath}user_primary$_ext';
}

class AppAssetImages {
  static const String _imagesPath = 'assets/images/';
  static const String _ext1 = '.png';
  static const String _ext2 = '.jpg';

  String bgCity = '${_imagesPath}bg_city$_ext1';
  String brokenImageIcon = '${_imagesPath}broken_image_icon$_ext2';
  String event = '${_imagesPath}event$_ext1';
  String growMoneyIllustration = '${_imagesPath}grow_money_illustration$_ext1';
  String illustrationFailedDialog =
      '${_imagesPath}illustration_failed_dialog$_ext1';
  String illustrationFailedDialog2 =
      '${_imagesPath}illustration_failed_dialog_2$_ext1';
  String logoLamaKoperasi = '${_imagesPath}logo_lama_koperasi$_ext1';
  String subtract1 = '${_imagesPath}subtract_1$_ext1';
  String defaultMemberCard = '${_imagesPath}default_member_card$_ext1';
}
