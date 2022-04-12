part of 'list_user_bloc.dart';

abstract class ListUserState extends Equatable {
  const ListUserState();
}

class ListUserInitial extends ListUserState {
  @override
  List<Object> get props => [];
}

class ShowListUser extends ListUserState {
  final List<String> listUser;

  const ShowListUser(this.listUser);

  @override
  List<Object> get props => [listUser];
}

class LoadingListUser extends ListUserState {
  @override
  List<Object> get props => [];
}
