(function () {
    var controllerId = 'app.manager.publicWechat.autoReply.createOrEdit';
    appModule.controller(controllerId, ['$scope', '$uiModal', 'infrastructure.services.app.autoReply', '$stateParams', '$state',
            function ($scope, $uiModal, autoReplyService, $stateParams, $state) {
                var vm = this;
                vm.autoReply = null;
                vm.articles = null;
                vm.requestTypes = {
                    ImageRequest: 0,
                    LinkRequest: 1,
                    LocationRequest: 2,
                    ShortVideoRequest: 3,
                    TextRequest: 4,
                    VideoRequest: 5,
                    VoiceRequest: 6,

                    EventRequest: 7,
                    Event_ClickRequest: 8,
                    Event_ViewRequest: 9,
                    Event_SubscribeRequest: 10,
                    Event_UnsubscribeRequest: 11,
                    Event_ScanRequest: 12,
                    Event_LocationRequest: 13,
                };
                vm.responseMsgTypes = {
                    Text: 0,
                    News: 1,
                    Music: 2,
                    Image: 3,
                    Voice: 4,
                    Video: 5,
                    Transfer_Customer_Service: 6,
                    MultipleNews: 106,
                    LocationMessage: 107
                };
                vm.getAutoReply = function () {
                    autoReplyService.getAutoReplyForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.autoReply = result.autoReply;
                        vm.articles = result.articles;
                    });
                };
                vm.openMediaIdSelector = function () {

                    switch (vm.autoReply.msgType) {
                        case vm.responseMsgTypes.News:
                            vm.openMediaIdOfNewsSelector();
                            break;
                        case vm.responseMsgTypes.Music:
                            break;
                        case vm.responseMsgTypes.Image:
                            vm.openMediaIdOfImageSelector();
                            break;
                        case vm.responseMsgTypes.Voice:
                            break;
                        case vm.responseMsgTypes.Video:
                            break;
                    }
                };
                vm.openMediaIdOfImageSelector = function () {
                    var modalInstance = $uiModal.open({
                        fullPage: true,
                        autoCreateFrame: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/PublicWechat/Common/mediaIdOfImageSelectorModal.cshtml',
                        controller: "app.manager.publicWechat.common.mediaIdOfImageSelectorModal as vm",
                    });
                    modalInstance.result.then(function (result) {
                        vm.autoReply.mediaId = result.media_id;
                    });
                };
                vm.openMediaIdOfNewsSelector = function () {
                    var modalInstance = $uiModal.open({
                        fullPage: true,
                        autoCreateFrame: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/PublicWechat/Common/mediaIdOfNewsSelectorModal.cshtml',
                        controller: "app.manager.publicWechat.common.mediaIdOfNewsSelectorModal as vm",
                    });
                    modalInstance.result.then(function (result) {
                        vm.autoReply.mediaId = result.media_id;
                    });
                };
                vm.addArticle = function () {
                    vm.articles = vm.autoReply.articles || [];
                    vm.articles.push({});
                };
                vm.removeArticle = function (index) {
                    vm.articles.splice(index);
                };
                vm.save = function () {
                    autoReplyService.createOrEdit({
                        autoReply: vm.autoReply,
                        articles:vm.articles
                    }).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("publicWechat.autoReply.index");
                    });
                };
                function initialize() {
                    vm.getAutoReply();
                }
                initialize();
            }
    ]);
})();