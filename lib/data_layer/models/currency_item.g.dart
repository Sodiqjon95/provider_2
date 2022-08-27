// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyItem _$CurrencyItemFromJson(Map<String, dynamic> json) => CurrencyItem(
      title: json['title'] as String? ?? '',
      date: json['date'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? '',
      nbuCellPrice: json['nbu_cell_price'] as String? ?? '',
    );

Map<String, dynamic> _$CurrencyItemToJson(CurrencyItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cbPrice,
      'nbu_buy_price': instance.nbuBuyPrice,
      'nbu_cell_price': instance.nbuCellPrice,
      'date': instance.date,
    };
