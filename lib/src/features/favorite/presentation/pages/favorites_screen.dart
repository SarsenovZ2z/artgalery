import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/favorite/presentation/controllers/favorite_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (_) => GetIt.instance()..load(LoadFavoritesParams()),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Избранное',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _FavoriteImages(),
          ],
        ),
      ),
    );
  }
}

class _FavoriteImages extends StatelessWidget {
  const _FavoriteImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, DataState<Favorites>>(
      builder: (context, state) {
        if (state is! LoadedState<Favorites>) {
          return Center(child: CircularProgressIndicator());
        }

        // TODO: instead use custom scroll view + slivers
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.result.images.length,
          itemBuilder: (_, index) => AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: state.result.images[index],
              fit: BoxFit.cover,
            ),
          ),
          separatorBuilder: (_, index) => SizedBox(height: 10),
        );
      },
    );
  }
}
