// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyResponse _$ProductionCompanyResponseFromJson(
    Map<String, dynamic> json) => ProductionCompanyResponse(
    json['name'] as String,
    json['origin_country'] as String,
  );

Map<String, dynamic> _$ProductionCompanyResponseToJson(
        ProductionCompanyResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
