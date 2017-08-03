angular.module('toDoList', ['ui.router'])
  .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: '/home.html',
        controller: 'MainCtrl'
      });
      .state('posts', {
        url: '/lists/{id}',
        templateUrl: '/lists.html',
        controller: 'ListsCtrl'
      });

    $urlRouterProvider.otherwise('home');
  }])
  .factory('lists', [function(){
    var o = {
      lists: []
    };
    return o;
  }])
  .controller('MainCtrl', ['$scope', 'lists', function($scope, lists){
    $scope.lists = [
      'list 1',
      'list 2',
      'list 3',
      'list 4',
      'list 5'
    ];
    $scope.lists = lists.lists;
  }])
  .controller('ListsCtrl', [
    '$scope',
    '$stateParams',
    'lists',
    function($scope, $stateParams, lists){
      $scope.list = lists.lists[$stateParams.id];
}]);
