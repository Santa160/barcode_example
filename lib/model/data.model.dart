import 'package:json_annotation/json_annotation.dart';

part 'data.model.g.dart';

@JsonSerializable()
class PrintLetterBarcodeData {
  PrintLetterBarcodeData({
    this.uid,
    this.name,
    this.gender,
    this.yob,
    this.co,
    this.loc,
    this.vtc,
    this.po,
    this.dist,
    this.subdist,
    this.state,
    this.pc,
    this.dob,
  });

  String? uid;
  String? name;
  String? gender;
  String? yob;
  String? co;
  String? loc;
  String? vtc;
  String? po;
  String? dist;
  String? subdist;
  String? state;
  String? pc;
  String? dob;

  /// A necessary factory constructor for creating a new PrintLetterBarcodeData instance
  /// from a map. Pass the map to the generated `_$PrintLetterBarcodeDataFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PrintLetterBarcodeData.
  factory PrintLetterBarcodeData.fromJson(Map<String, dynamic> json) =>
      _$PrintLetterBarcodeDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PrintLetterBarcodeDataToJson`.
  Map<String, dynamic> toJson() => _$PrintLetterBarcodeDataToJson(this);
}
