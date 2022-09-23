import 'package:git_users/core/adapters/http/http_client.dart';
import 'package:git_users/core/adapters/http/http_interface.dart';
import 'package:git_users/core/adapters/injector/injector.dart';
import 'package:git_users/core/adapters/shared_preferences/shared_prefs.dart';
import 'package:git_users/core/adapters/shared_preferences/shared_prefs_interface.dart';
import 'package:git_users/modules/search_history/data/datasources/search_history_datasource.dart';
import 'package:git_users/modules/search_history/domain/repositories/search_history_repository_interface.dart';
import 'package:git_users/modules/search_history/domain/usecases/get_search_history_usecase.dart';
import 'package:git_users/modules/search_history/infra/datasource/search_history_data_source.dart';
import 'package:git_users/modules/search_history/infra/repositories/search_history_respository.dart';
import 'package:git_users/modules/home_screen/data/datasources/user_data_source.dart';
import 'package:git_users/modules/home_screen/domain/repositories/user_repository_interface.dart';
import 'package:git_users/modules/home_screen/domain/usecases/get_user_usecase.dart';
import 'package:git_users/modules/home_screen/infra/datasource/user_data_source_interface.dart';
import 'package:git_users/modules/home_screen/infra/repositories/user_respository.dart';
import 'package:git_users/modules/home_screen/presenter/screens/home_screen/home_screen_bloc/home_screen_bloc.dart';
import 'package:git_users/modules/search_history/presenter/bloc/search_history_bloc.dart';

import '../../modules/search_history/domain/usecases/save_new_search_usecase.dart';

Future<void> initAllDependencies() async {
  //CORE DEPENDENCIES
  I.registerDependency<ISharedPreferences>(
    SharedPrefs(),
  );
  I.registerDependency<IHttpClient>(
    HttpClient(),
  );

  //END CORE DEPENDENCIES

  //SEARCH HISTORY
  I.registerDependency<ISearchHistoryDataSource>(
    SearchHistoryDataSource(prefs: I.getDependency<ISharedPreferences>()),
  );
  I.registerDependency<ISearchHistoryRepository>(
    SearchHistoryRepository(
        searchHistoryDataSource: I.getDependency<ISearchHistoryDataSource>()),
  );
  I.registerDependency<IGetSearchHistoryUseCase>(
    GetSearchHistoryUseCase(
        repository: I.getDependency<ISearchHistoryRepository>()),
  );
  I.registerDependency<ISaveNewSearchUseCase>(
    SaveNewSearchUseCase(
        repository: I.getDependency<ISearchHistoryRepository>()),
  );
  //END SEARCH HISTORY

  //USERS AREA
  I.registerDependency<IUserDataSource>(
    UserDataSource(client: I.getDependency<IHttpClient>()),
  );
  I.registerDependency<IUserRepository>(
    UserRepository(
      userDataSource: I.getDependency<IUserDataSource>(),
    ),
  );
  I.registerDependency<IGetUserUseCase>(
    GetUserUseCase(
      repository: I.getDependency<IUserRepository>(),
    ),
  );
  I.registerDependency<HomeScreenBloc>(
    HomeScreenBloc(
        getUserUseCase: I.getDependency<IGetUserUseCase>(),
        saveSearchUseCase: I.getDependency<ISaveNewSearchUseCase>()),
  );

  I.registerDependency<SearchHistoryBloc>(
    SearchHistoryBloc(
      useCase: I.getDependency<IGetSearchHistoryUseCase>(),
    ),
  );
  //END USERS AREA
}
