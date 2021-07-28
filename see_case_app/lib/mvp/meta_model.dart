import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel extends Object {
  @JsonKey(name: 'pagination')
  final Pagination? pagination;

  MetaModel({
    this.pagination,
  });

  factory MetaModel.fromJson(Map<String, dynamic> srcJson) =>
      _$MetaModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@JsonSerializable()
class Pagination extends Object {
  @JsonKey(name: 'total')
  final int? total;

  @JsonKey(name: 'count')
  final int? pagCount;

  @JsonKey(name: 'per_page')
  final int? perPage;

  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'links')
  final Links? links;

  Pagination({
    this.total,
    this.pagCount,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> srcJson) =>
      _$PaginationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Links extends Object {
  @JsonKey(name: 'next')
  final String? next;

  Links({
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> srcJson) =>
      _$LinksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
