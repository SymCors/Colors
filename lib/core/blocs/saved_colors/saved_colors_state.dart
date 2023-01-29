part of 'saved_colors_cubit.dart';

/// [SavedColorsState] is the state of the [SavedColorsCubit].
@immutable
abstract class SavedColorsState {}

/// [SavedColorsInitial] is the initial state of the [SavedColorsCubit].
class SavedColorsInitial extends SavedColorsState {}

/// [SavedColorsLoading] is the state when the [SavedColorsCubit] is loading.
class SavedColorsLoading extends SavedColorsState {}

/// [SavedColorsLoaded] is the state when the [SavedColorsCubit] has loaded.
class SavedColorsLoaded extends SavedColorsState {
  /// The list of saved colors.
  final List<String> colors;

  /// Constructor for [SavedColorsLoaded].
  SavedColorsLoaded({required this.colors});
}

/// [SavedColorsError] is the state when the [SavedColorsCubit] has an error.
class SavedColorsError extends SavedColorsState {
  /// The error message.
  final String message;

  /// Constructor for [SavedColorsError].
  SavedColorsError({required this.message});
}

/// [SavedColorsSaving] is the state when the [SavedColorsCubit] is saving.
class SavedColorsSaving extends SavedColorsState {}

/// [SavedColorsSaved] is the state when the [SavedColorsCubit] has saved.
class SavedColorsSaved extends SavedColorsState {}

/// [SavedColorsSaveFailed] is the state when the [SavedColorsCubit]
/// has failed to save.
class SavedColorsSaveFailed extends SavedColorsState {
  /// The error message.
  final String message;

  /// Constructor for [SavedColorsSaveFailed].
  SavedColorsSaveFailed({required this.message});
}
