abstract class Routes {
  // domain url
  static String domain = 'http://192.168.8.100/';
  static String domain_idir = 'http://192.168.43.96/';
  static String domain_midou = 'http://192.168.8.104/';
  static String domain_localhost = 'http://localhost/';
  // base url
  static String base = domain_idir;
  //  url
  static String categories = '${base}api/categories/';
  static String quotes = '${base}api/quotes/';
  static String users = '${base}api/users/';
}
