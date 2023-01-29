import 'package:colors/core/database/hive_box_names.dart';
import 'package:colors/core/database/hive_repository.dart';
import 'package:colors/core/models/color_save_model/color_save_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'saved_colors_state.dart';

/// [SavedColorsCubit] is the cubit that handles the saved colors.
class SavedColorsCubit extends Cubit<SavedColorsState> {
  /// Constructor for [SavedColorsCubit].
  SavedColorsCubit() : super(SavedColorsInitial());

  /// [getSavedColors] gets the saved colors.
  Future<void> getSavedColors() async {
    emit(SavedColorsLoading());
    try {
      final Box<ColorSaveModel> savedColorsBox =
          await HiveRepository.openBox<ColorSaveModel>(HiveBoxNames.colors);
      final model = savedColorsBox.get(HiveBoxNames.colors);
      await savedColorsBox.close();
      emit(SavedColorsLoaded(colors: model?.hex ?? []));
    } on Exception catch (e) {
      emit(SavedColorsError(message: e.toString()));
    }
  }

  /// [saveColor] saves the color.
  Future<void> saveColor(String hex) async {
    emit(SavedColorsSaving());
    try {
      final Box<ColorSaveModel> savedColorsBox =
          await HiveRepository.openBox<ColorSaveModel>(HiveBoxNames.colors);
      final model = savedColorsBox.get(HiveBoxNames.colors);
      if (model != null) {
        model.hex.add(hex);
        await savedColorsBox.put(HiveBoxNames.colors, model);
      } else {
        await savedColorsBox.put(
          HiveBoxNames.colors,
          ColorSaveModel(hex: [hex]),
        );
      }
      await savedColorsBox.close();
      emit(SavedColorsSaved());
    } on Exception catch (e) {
      emit(SavedColorsSaveFailed(message: e.toString()));
    }
  }

  /// [deleteSavedColor] deletes the saved color.
  Future<void> deleteSavedColor(String color) async {
    try {
      final Box<ColorSaveModel> savedColorsBox =
          await HiveRepository.openBox<ColorSaveModel>(HiveBoxNames.colors);
      final model = savedColorsBox.get(HiveBoxNames.colors);
      if (model != null) {
        model.hex.remove(color);
        await savedColorsBox.put(HiveBoxNames.colors, model);
      }
      await savedColorsBox.close();
      emit(SavedColorsLoaded(colors: model?.hex ?? []));
    } on Exception catch (e) {
      emit(SavedColorsError(message: e.toString()));
    }
  }
}
