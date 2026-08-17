import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/database/app_database.dart';
import '../features/posts/data/datasources/post_local_data_source.dart';
import '../features/posts/data/datasources/post_remote_data_source.dart';
import '../features/posts/data/repositories/post_repository_impl.dart';
import '../features/posts/domain/repositories/post_repository.dart';
import '../features/posts/domain/usecases/create_post.dart';
import '../features/posts/domain/usecases/get_posts.dart';
import '../features/posts/presentation/controllers/post_list_controller.dart';
import '../features/posts/presentation/pages/post_list_page.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({required this.database, required this.dio, super.key});

  final AppDatabase database;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: database),
        Provider<Dio>.value(value: dio),

        Provider<PostRepository>(
          create: (context) => PostRepositoryImpl(
            remoteDataSource: DioPostRemoteDataSource(context.read<Dio>()),
            localDataSource: DriftPostLocalDataSource(
              context.read<AppDatabase>(),
            ),
          ),
        ),

        Provider<GetPosts>(
          create: (context) => GetPosts(context.read<PostRepository>()),
        ),
        Provider<CreatePost>(
          create: (context) => CreatePost(context.read<PostRepository>()),
        ),

        ChangeNotifierProvider<PostListController>(
          create: (context) =>
              PostListController(getPosts: context.read<GetPosts>()),
        ),
      ],
      child: MaterialApp(
        title: 'JSONPlaceholder Posts',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const PostListPage(),
      ),
    );
  }
}
