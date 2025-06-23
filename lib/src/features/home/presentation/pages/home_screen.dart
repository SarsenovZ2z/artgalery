import 'package:cached_network_image/cached_network_image.dart';
import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/image/presentation/controllers/search_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchImagesCubit>(
      create: (_) => GetIt.instance()..load(LoadImagesParams('Van Gogh')),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            _Search(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: _Images(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
          image: AssetImage('assets/images/starry-night.jpg'),
        ),
      ),
      child: Center(
        child: _SearchForm(),
      ),
    );
  }
}

class _SearchForm extends StatefulWidget {
  const _SearchForm({super.key});

  @override
  State<_SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<_SearchForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        onFieldSubmitted: _onSubmit,
        decoration: InputDecoration(
          hintText: 'Поиск',
          // fontWeight: 300 -> TODO: add roboto light;
          filled: true,
          contentPadding: EdgeInsets.all(20),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }
}

class _Images extends StatelessWidget {
  const _Images({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchImagesCubit, DataState<Images>>(
        builder: (context, state) {
      if (state is! LoadedState<Images>) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      // TODO: instead use custom scroll view + slivers
      return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.result.images.length,
        itemBuilder: (_, index) => AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: state.result.images[index].url,
            fit: BoxFit.cover,
          ),
        ),
        separatorBuilder: (_, index) => SizedBox(height: 10),
      );
    });
  }
}
