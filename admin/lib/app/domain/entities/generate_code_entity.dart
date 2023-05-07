// ignore_for_file: public_member_api_docs, sort_constructors_first
class GenretaeCodeEntity {
  int? idgenerateCode;
  String? codegenerated;
  String? tablela;
  DateTime? createdAt;
  DateTime? updatedAt;

  GenretaeCodeEntity({
    this.idgenerateCode,
    this.codegenerated,
    this.tablela,
    this.createdAt,
    this.updatedAt,
  });
  

  @override
  String toString() {
    return 'GenretaeCodeEntity(idgenerateCode: $idgenerateCode, '
    'codegenerated: $codegenerated, tablela: $tablela, createdAt: $createdAt, '
    'updatedAt: $updatedAt)';
  }
}
