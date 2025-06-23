import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/favorite/presentation/controllers/favorite_cubit.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/presentation/controllers/image_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class ImageScreen extends StatelessWidget {
  final String imageId;

  const ImageScreen({
    super.key,
    required this.imageId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoritesCubit>(
          create: (_) => GetIt.instance()..load(LoadFavoritesParams()),
        ),
        BlocProvider<ImageCubit>(
          create: (_) => GetIt.instance()..load(LoadImageParams(imageId)),
        ),
      ],
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _UserInfo(),
            _Image(),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, DataState<ImageResult>>(
        builder: (context, state) {
      if (state is! LoadedState<ImageResult>) {
        // TODO: show shimmer
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 48,
                height: 48,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: state.result.image.userImage,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.result.image.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '@${state.result.image.username}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            _FavoriteButton(
              image: state.result.image,
            ),
            IconButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.yellow),
              ),
              icon: SvgPicture.asset(
                'assets/icons/download.svg',
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, DataState<ImageResult>>(
        builder: (context, state) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 1,
          child: state is! LoadedState<ImageResult>
              ? SizedBox()
              : CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: state.result.image.url,
                ),
        ),
      );
    });
  }
}

class _FavoriteButton extends StatelessWidget {
  final ImageEntity image;

  const _FavoriteButton({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, DataState<Favorites>>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<FavoritesCubit>().toggle(image);
          },
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          icon: _HeartIcon(
            filled: state is LoadedState<Favorites> &&
                state.result.isFavorite(image),
          ),
        );
      },
    );
  }
}

class _HeartIcon extends StatelessWidget {
  final bool filled;

  const _HeartIcon({
    super.key,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/heart.svg',
      colorFilter: ColorFilter.mode(
        filled ? Colors.red : Colors.black,
        filled ? BlendMode.srcIn : BlendMode.srcIn,
      ),
    );
  }
}
