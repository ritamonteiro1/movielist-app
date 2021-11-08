// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyRM _$ProductionCompanyRMFromJson(Map<String, dynamic> json) {
  return ProductionCompanyRM(
    json['name'] as String,
    json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompanyRMToJson(
        ProductionCompanyRM instance) =>
    <String, dynamic>{
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
