enum PostApiStatus {initial, loading, success, error}

enum Status {loading, completed, error}


enum Language {
  english(flag: '', name: 'english', code: 'en'),
  hindi(flag: '', name: 'hindi', code: 'hi'),
  korea(flag: '', name: 'korea', code: 'ko');

  const Language({
    required this.flag,
    required this.name,
    required this.code,
  });

  final String flag;
  final String name;
  final String code;

  static Language fromCode(String code) {
    return Language.values.firstWhere(
          (lang) => lang.code == code,
      orElse: () => Language.english,
    );
  }
}
