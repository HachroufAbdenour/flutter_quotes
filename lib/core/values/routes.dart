abstract class Routes {
  // domain url
  static String domain = 'http://192.168.8.104/';
  static String domain_test = 'http://192.168.8.104/';
  static String domain_midou = 'http://192.168.8.105/';
  static String domain_localhost = 'http://192.168.8.104/';
  // base url
  static String base = domain_midou;
  //  url
  static String quotes = '${base}api/quotes/';
  static String users = '${base}api/users/';
  static String themes = '${base}api/themes/';
  static String categories = '${base}api/categories/';
}
