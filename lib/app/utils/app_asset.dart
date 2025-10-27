class AppAsset {
  static _AppAssetSvg svgs = _AppAssetSvg();
  static _AppAssetImages images = _AppAssetImages();
}

class _AppAssetSvg {
  static String _svgsPath = 'assets/svgs/';
  static String _ext = '.svg';

  String arrowLeftBlack = '${_svgsPath}arrow_head_left_black${_ext}';
  String arrowLeftWhite = '${_svgsPath}arrow_head_left_white${_ext}';
  String calendarDarkGray = '${_svgsPath}calendar_dark_gray${_ext}';
  String clockDarkGray = '${_svgsPath}clock_dark_gray${_ext}';
  String locationPinDarkGray = '${_svgsPath}location_pin_dark_gray${_ext}';
}

class _AppAssetImages {
  static String imagesPath = 'assets/images/';
  static String _ext1 = '.png';
  // static String _ext2 = '.jpg';

  String logoLamaKoperasi = '${imagesPath}logo_lama_koperasi${_ext1}';
  String bgCity = '${imagesPath}bg_city${_ext1}';
  String growMoneyIllustration = '${imagesPath}grow_money_illustration${_ext1}';
}
