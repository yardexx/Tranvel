part of 'catalog_cubit.dart';

enum CatalogStatus { initial, loading, success, failure }

@JsonSerializable()
class CatalogState extends Equatable {

  const CatalogState({
    this.status = CatalogStatus.initial,
    Catalog? catalog,
  }) : catalog = catalog ?? Catalog.empty;

  factory CatalogState.fromJson(Map<String, dynamic> json) =>
      _$CatalogStateFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogStateToJson(this);

  final CatalogStatus status;
  final Catalog catalog;

  CatalogState copyWith({
    CatalogStatus? status,
    Catalog? catalog,
  }) {
    return CatalogState(
      status: status ?? this.status,
      catalog: catalog ?? this.catalog,
    );
  }

  @override
  List<Object?> get props => [status, catalog];
}
