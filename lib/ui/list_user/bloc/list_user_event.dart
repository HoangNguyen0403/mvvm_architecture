part of 'list_user_bloc.dart';

abstract class ListUserEvent extends Equatable {
  const ListUserEvent();
}

class LoadMoreUser extends ListUserEvent {
  @override
  List<Object> get props => [];
}

class GetListUser extends ListUserEvent {
  @override
  List<Object> get props => [];
}
