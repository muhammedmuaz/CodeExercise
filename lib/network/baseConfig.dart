abstract class BaseConfig {
  String get apiUrl;
  String get baseUrl;
  String get packagename;
  // String get socketUrl;
}

class Varient2Config implements BaseConfig {
  @override
  String get baseUrl => "http://api.duckduckgo.com/?q=the+wire+characters&";
  @override
  String get apiUrl => "http://api.duckduckgo.com/?q=the+wire+characters&";
  @override
  String get packagename => "com.sample.wireviewer";
}

class Varient1Config implements BaseConfig {
  @override
  String get baseUrl => "http://api.duckduckgo.com/?q=simpsons+characters&";
  @override
  String get apiUrl => "http://api.duckduckgo.com/?q=simpsons+characters&";
  @override
  String get packagename => "com.sample.simpsonsviewer";
}
//flutter run --dart-define=ENVIRONMENT=dev