class TranslatorModel {
  String lang;
  String words;

  TranslatorModel(this.lang, this.words);

  factory TranslatorModel.fromJson(dynamic json) {
    return TranslatorModel("${json['lang']}", "${json['words']}");
  }

  Map toJson() => {'lang': lang, 'words': words};
}

class ResultTranslatorModel {
  String original;
  String translation;

  ResultTranslatorModel(this.original, this.translation);

  factory ResultTranslatorModel.fromJson(dynamic json) {
    return ResultTranslatorModel("${json['original']}", "${json['translation']}");
  }

  Map toJson() => {'original': original, 'translation': translation};
}
