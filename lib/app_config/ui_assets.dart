class UIAssets {
  //image directory
  static const imageDir = "assets/images/";

//app launcher and splash icons
  static const appLogo = "${imageDir}app_logo.png";
  static const appLogoWhite = "${imageDir}app_logo_white.png";
  static const introImage1 = "${imageDir}intro_screen_1.png";
  static const productPlaceholder = "${imageDir}product_placeholder.jpg";
  // static const introImage2 = "${imageDir}intro_screen_2.svg";

  //svg asset directory
  static const svgDir = "assets/svg/";

  static const mobileVerificationBG = "assets/svg/mobile_verification_bg.svg";


  //svg login asset directory
  static const svgBgDirLogin = "assets/svg/login_bg_asset/";
  static const svgBgDirSplash = "assets/svg/splash_bg_asset/";


  static const loginBgCenterLeft = "${svgBgDirLogin}bg_center_left.svg";
  static const loginBgCenterRight = "${svgBgDirLogin}bg_center_right.svg";
  static const loginBgTopCenter = "${svgBgDirLogin}bg_top_center.svg";
  static const loginBgLogo = "${svgBgDirLogin}login_logo.svg";


  static const splashBottomCenter = "${svgBgDirSplash}splash_bottom_center.svg";
  static const splashTopRight = "${svgBgDirSplash}splash_top_right.svg";


  // svg icons
  static const homeIcon = "${svgDir}home.svg";
  static const categoryIcon = "${svgDir}categories.svg";
  static const cartIcon = "${svgDir}bag.svg";
  static const profileIcon = "${svgDir}profile.svg";
  static const paperIcon = "${svgDir}paper.svg";
  static const chatIcon = "${svgDir}message.svg";


  static const userAvatar = "${imageDir}user_avatar.png";

  //img icons
  // static const khaltiIcon = iconsDir+"khalti.png";

  // flare animations
  static const animationDir = "assets/flares/";

  static const emptyViewAnim = "${animationDir}empty_view.flr";
  static const liquidLoading = "liquid_loader.flr";

  //gif images
  static const gifDir = "assets/gif/";
  static const gifLoading = "${gifDir}loading.gif";

  //helper methods
  static String getImage(String imageName) {
    return 'assets/images/$imageName';
  }
  static String getDummyImage(String imageName) {
    return 'assets/images/dummy_images/$imageName';
  }

  static String getIcon(String iconName) {
    return 'assets/icons/$iconName';
  }

  static String getSvg(String svgName) {
    return 'assets/svg/$svgName';
  }

  static getdummypage(String s) {}

}
