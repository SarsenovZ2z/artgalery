import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _Search(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            sliver: _Images(),
          ),
        ],
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
    return SliverList.separated(
      itemCount: 5,
      itemBuilder: (_, index) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: Colors.red,
          child: Center(child: Text(index.toString())),
        ),
      ),
      separatorBuilder: (_, index) => SizedBox(height: 10),
    );
  }
}
