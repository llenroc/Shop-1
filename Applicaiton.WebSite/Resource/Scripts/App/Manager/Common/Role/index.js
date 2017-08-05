(function () {
    var controllerId = 'app.manager.role.index';
    appModule.controller(controllerId,
        ['$scope',  'infrastructure.services.app.role','$state', function ($scope, roleService,$state) {
            var vm = this;
            vm.roles = [];
            var $rolesTable = $('#rolesTable');

            $rolesTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: roleService.getAllOfPage,
                        callback: function (result) {
                            vm.roles = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    roleName: {
                    },
                    displayName: {
                    },
                    isDefault: {
                    },
                    isStatic: {
                    },
                    creationTime: {
                    },
                }
            });

            function getRoles() {
                $rolesTable.table().data("canknow.table").load();
            }

            vm.delete=function(role) {
                infrastructure.message.confirm("RoleDeleteWarningMessage",
                    function () {
                        roleService.deleteRole({
                            id: role.id
                        }).success(function () {
                            getRoles();
                            infrastructure.notify.success("SuccessfullyDeleted");
                        });
                    }
                );
            };
        }
    ]);
})();