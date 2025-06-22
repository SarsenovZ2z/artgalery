import 'package:artgalery/src/utils/unsplash_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'common/presentation/widgets/shimmer.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Shimmer(
        child: Center(
          child: ShimmerLoading(
            isLoading: true,
            child: InkWell(
              onTap: () async {
                final res = await UnsplashClient().get(
                    '/search/photos',
                  queryParameters: {
                    'query': "Van Gogh",
                    'per_page': 10,
                  },
                );
                print(res.data);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
