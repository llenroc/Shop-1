(function () {
    var controllerId = 'app.manager.address.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.addressForEnd', '$state', '$uiModal', '$stateParams',
            function ($scope, addressService, $state, $uiModal, $stateParams) {
                var vm = this;
                vm.addresss = [];
                parentId = $stateParams.parentId ? $stateParams.parentId : 1;
                var $addressTable = $('#addressTable');
                $addressTable.table({
                    paging: true,
                    sorting: true,
                    initializeLoad:false,
                    actions: {
                        listAction: {
                            method: addressService.getAllOfPage,
                            callback: function (result) {
                                vm.addresss = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    },
                    fields: {
                        id: {
                        },
                    }
                });
                function createRequestParams() {
                    var params = { parentId: parentId };
                    return params;
                }
                vm.getAddresses = function () {
                    $addressTable.table().data("canknow.table").load(createRequestParams());
                };
                vm.openEditModal = function (id) {
                    var modalInstance = $uiModal.open({
                        fullPage: false,
                        templateUrl: '/Areas/Manager/Views/Host/Address/EditModal.cshtml',
                        controller: "app.manager.address.editModal as vm",
                        resolve: {
                            id: function () {
                                return id;
                            }
                        }
                    });
                    modalInstance.result.then(function (result) {
                        vm.getAddresses();
                    });
                };
                vm.initialize = function () {
                    vm.getAddresses();
                };
                vm.initialize();
            }
        ]);
})();