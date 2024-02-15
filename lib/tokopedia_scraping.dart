import 'package:dart_tokopedia_search_scraping/result.dart';
import 'package:dart_tokopedia_search_scraping/tokopedia_result.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class TokopediaScrapping {
  static const String _url = "tokopedia.com";

  Future<Result> callTokopediaSearch({
    String query = "Samsung",
  }) async {
    try {
      final response = await http.get(
        Uri.https(_url, "/search", {
          'q': query,
        }),
      );

      switch (response.statusCode) {
        case 200:
          final data = response.body;

          final tokopediaResultList = getTokopediaResult(data);

          return Success(tokopediaResultList);
        default:
          return Failure(Exception(response.reasonPhrase));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  List<TokopediaResult> getTokopediaResult(String data) {
    final html = parse(data);

    final products =
        html.getElementsByTagName("div[data-testid=master-product-card]");
    final List<TokopediaResult> tokopediaResultList = [];
    for (var product in products) {
      final productName =
          product.getElementsByClassName("prd_link-product-name");
      final productPrice =
          product.getElementsByClassName("prd_link-product-price");
      final ratingAverage =
          product.getElementsByClassName("prd_rating-average-text");
      final shopName = product.getElementsByClassName("prd_link-shop-name");
      final shopLoc = product.getElementsByClassName("prd_link-shop-loc");
      final imgLink =
          product.getElementsByTagName("img[data-testid=imgSRPProdMain]");
      final productLink = product.getElementsByTagName("div.css-19oqosi > a");

      if (productName.isNotEmpty) {
        tokopediaResultList.add(TokopediaResult(
          productName: productName[0].text.toString().trim(),
          productPrice: productPrice[0].text.toString().trim(),
          ratingAverage:
              double.tryParse(ratingAverage[0].text.toString().trim()),
          shopName: shopName[0].text.toString().trim(),
          shopLoc: shopLoc[0].text.toString().trim(),
          imgLink: imgLink.map((e) => e.attributes["src"]).first,
          productLink: productLink.map((e) => e.attributes["href"]).first,
        ));
      }
    }

    return tokopediaResultList;
  }
}
