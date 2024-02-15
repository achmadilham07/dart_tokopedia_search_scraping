import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_tokopedia_search_scraping/result.dart';
import 'package:dart_tokopedia_search_scraping/tokopedia_result.dart';
import 'package:dart_tokopedia_search_scraping/tokopedia_result_list.dart';
import 'package:dart_tokopedia_search_scraping/tokopedia_scraping.dart';

void main(List<String> args) async {
  // argument
  var parser = ArgParser()
    ..addOption('query',
        abbr: 'q',
        defaultsTo: "Samsung",
        help: 'The keyword to searched in Tokopedia.')
    ..addOption('filename',
        abbr: 'f',
        defaultsTo: "tokopedia-samsung-product.json",
        help: 'The filename that will be saved.')
    ..addFlag('help',
        abbr: 'h',
        defaultsTo: false,
        help: 'This is a usage instruction.',
        negatable: false);

  final argResults = parser.parse(args);
  final String query = argResults['query'];
  final String filename = argResults['filename'];

  if (argResults.wasParsed('help')) {
    print(parser.usage);
    exit(0);
  }

  // get data from api and structurated
  final result = await TokopediaScrapping().callTokopediaSearch(query: query);

  final data = switch (result) {
    Success(value: final data) => data,
    Failure(exception: final exception) => 'Something went wrong: $exception',
  };

  // show the data
  if (data is List<TokopediaResult>) {
    // save to file
    final finalData = TokopediaResultList(result: data);
    File file = File(filename);
    file.writeAsStringSync(jsonEncode(finalData.toMap()));
    print('File written.');
  } else {
    print(data);
  }
}
