import 'package:colors/core/database/hive_type_ids.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'color_save_model.g.dart';

/// [ColorSaveModel] is a model that is used to save the color in Hive.
@HiveType(typeId: HiveTypeIds.colorModel)
class ColorSaveModel {
  /// The hex values of the saved colors
  @HiveField(0)
  final List<String> hex;

  /// [ColorSaveModel] constructor.
  ColorSaveModel({required this.hex});
}
