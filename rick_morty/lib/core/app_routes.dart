class AppRoutes {
  static const String characterList = '/';
  static const String characterDetail = '/character';

  static String getCharacterDetailPath(String id) => '/character/$id';
}