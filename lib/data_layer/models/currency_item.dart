import 'package:json_annotation/json_annotation.dart';

part 'currency_item.g.dart';

// {
// "title": "BAA dirhami",
// "code": "AED",
// "cb_price": "2973.04",
// "nbu_buy_price": "",
// "nbu_cell_price": "",
// "date": "26.08.2022"
// },
@JsonSerializable()
class CurrencyItem {
  @JsonKey(defaultValue: '', name: 'title')
  String title;

  @JsonKey(defaultValue: '', name: 'code')
  String code;

  @JsonKey(defaultValue: '', name: 'cb_price')
  String cbPrice;

  @JsonKey(defaultValue: "", name: 'nbu_buy_price')
  String nbuBuyPrice;

  @JsonKey(defaultValue: '', name: 'nbu_cell_price')
  String nbuCellPrice;

  @JsonKey(defaultValue: '', name: 'date')
  String date;

  CurrencyItem({
    required this.title,
    required this.date,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
  });

  factory CurrencyItem.fromJson(Map<String, dynamic> json) =>
      _$CurrencyItemFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyItemToJson(this);

  @override
  String toString() => '''
      title: $title,
      code: $code,
      cb_price: $cbPrice,
      nbu_buy_price: $nbuBuyPrice,
      nbu_cell_price: $nbuCellPrice,
      date: $date,
      ''';
}