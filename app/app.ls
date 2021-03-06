# Declare app level module which depends on filters, and services
angular.module \app, <[ partials ngResource app.controllers app.directives app.filters app.services ui.directives ui.state ]>

.config <[$stateProvider $urlRouterProvider $locationProvider]> ++ ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $stateProvider
    .state 'budget' do
      url: '/budget'
      templateUrl: '/partials/partial4.html'
      controller: \BudgetItem
    .state 'budget.detail' do
      url: '/{code}'
      templateUrl: '/partials/partial4.html'

  $urlRouterProvider
    .otherwise('/budget')

  $locationProvider.html5Mode true

  log.setLogLevel $('#script_app').attr('data-log-level')
  log.debug 'setLogLevel:', $('#script_app').attr('data-log-level')

.run <[$rootScope $state $stateParams $location]> ++ ($rootScope, $state, $stateParams, $location) ->
  $rootScope.$state = $state
  $rootScope.$stateParam = $stateParams
  $rootScope.go = -> $location.path it
  #$rootScope._build = window.global.config.BUILD
  $rootScope.$on \$stateChangeSuccess (e, {url,name}) ->
    window?ga? 'send' 'pageview' page: url, title: name
