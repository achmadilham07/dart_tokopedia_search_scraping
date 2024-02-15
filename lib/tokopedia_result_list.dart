// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dart_tokopedia_search_scraping/tokopedia_result.dart';

class TokopediaResultList {
  List<TokopediaResult> result;
  TokopediaResultList({
    required this.result,
  });

  TokopediaResultList copyWith({
    List<TokopediaResult>? result,
  }) {
    return TokopediaResultList(
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory TokopediaResultList.fromMap(Map<String, dynamic> map) {
    return TokopediaResultList(
      result: List<TokopediaResult>.from((map['result'] as List<int>).map<TokopediaResult>((x) => TokopediaResult.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TokopediaResultList.fromJson(String source) => TokopediaResultList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TokopediaResultList(result: $result)';

  @override
  bool operator ==(covariant TokopediaResultList other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      listEquals(other.result, result);
  }

  @override
  int get hashCode => result.hashCode;
}
