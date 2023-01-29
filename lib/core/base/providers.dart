import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/core/blocs/saved_colors/saved_colors_cubit.dart';
import 'package:colors/core/blocs/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Providers] is a class that contains all the providers of the app.
class Providers {
  /// Returns all the providers of the app.
  static List<BlocProvider> get providers => [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<SavedColorsCubit>(create: (context) => SavedColorsCubit()),
      ];
}
