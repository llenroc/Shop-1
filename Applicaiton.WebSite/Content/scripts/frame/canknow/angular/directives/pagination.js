/**
 * name: pagination
 * Version: 1.0.0 beta
 */
appModule.directive('pagination', [function () {
    return {
        template: '<div class="pagination-container">' +
            '<ul class="pagination" ng-show="config.totalCount > 0">' +
            '<li ng-class="{disabled: config.currentIndex == 1}" ng-click="prevPage()"><a>&laquo;</a></li>' +
            '<li ng-repeat="item in paginationList track by $index" ng-class="{current: item == config.currentIndex, separate: item == \'...\'}" ' +
            'ng-click="changecurrentIndex(item)">' +
            '<a>{{ item }}</a>' +
            '</li>' +
            '<li ng-class="{disabled: config.currentIndex == config.pageCount}" ng-click="nextPage()"><a>&raquo;</a></li>' +
            '</ul>' +
            '</div>',
        replace: true,
        scope:false,
        link: function (scope, element, attrs) {
            var config = scope.paginationConfig;

            if (!config) {
                return;
            }

            // 默认分页长度
            var defaultPagesLength = 5;

            // 默认分页大小可调整每页显示的条数
            var defaultPageSizeOptions = [10, 15, 20, 30, 50];

            // 默认每页的个数
            var defaultPageSize = defaultPageSizeOptions[0];

            // 获取分页长度
            if (config.pagesLength) {

                // 判断一下分页长度
                config.pagesLength = parseInt(config.pagesLength, 10);

                if (!config.pagesLength) {
                    config.pagesLength = defaultPagesLength;
                }

                // 分页长度必须为奇数，如果传偶数时，自动处理
                if (config.pagesLength % 2 === 0) {
                    config.pagesLength += 1;
                }

            }
            else {
                config.pagesLength = defaultPagesLength
            }

            // 分页选项可调整每页显示的条数
            if (!config.pageSizeOptions) {
                config.pageSizeOptions = defaultPagesLength;
            }

            // paginationList数组
            function getPagination(newValue, oldValue) {

                // config.currentIndex
                if (config.currentIndex) {
                    config.currentIndex = parseInt(config.currentIndex, 10);
                }

                if (!config.currentIndex) {
                    config.currentIndex = 1;
                }

                // config.totalCount
                if (config.totalCount) {
                    config.totalCount = parseInt(config.totalCount, 10);
                }

                // config.totalCount
                if (!config.totalCount) {
                    config.totalCount = 0;
                    return;
                }

                // config.pageSize 
                if (config.pageSize) {
                    config.pageSize = parseInt(config.pageSize, 10);
                }

                if (!config.pageSize) {
                    config.pageSize = defaultPageSize;
                }

                // pageCount
                config.pageCount = Math.ceil(config.totalCount / config.pageSize);

                // 如果分页总数>0，并且当前页大于分页总数
                if (config.pageCount > 0 && config.currentIndex > config.pageCount) {
                    config.currentIndex = config.pageCount;
                }

                // 如果pageSize在不在pageSizeOptions数组中，就把pageSize加入这个数组中
                var pageSizeOptionsLength = config.pageSizeOptions.length;

                // 定义状态
                var pageSizeOptionsStatus;

                for (var i = 0; i < pageSizeOptionsLength; i++) {

                    if (config.pageSizeOptions[i] == config.pageSize) {
                        pageSizeOptionsStatus = true;
                    }
                }

                // 如果pageSize在不在pageSizeOptions数组中，就把pageSize加入这个数组中
                if (!pageSizeOptionsStatus) {
                    config.pageSizeOptions.push(config.pageSize);
                }

                // 对选项进行sort
                config.pageSizeOptions.sort(function (a, b) { return a - b });


                // 页码相关
                scope.paginationList = [];

                if (config.pageCount <= config.pagesLength) {

                    // 判断总页数如果小于等于分页的长度，若小于则直接显示
                    for (i = 1; i <= config.pageCount; i++) {
                        scope.paginationList.push(i);
                    }
                }
                else {
                    // 总页数大于分页长度（此时分为三种情况：1.左边没有...2.右边没有...3.左右都有...）
                    // 计算中心偏移量
                    var offset = (config.pagesLength - 1) / 2;

                    if (config.currentIndex <= offset) {

                        // 左边没有...
                        for (i = 1; i <= offset + 1; i++) {
                            scope.paginationList.push(i);
                        }
                        scope.paginationList.push('...');
                        scope.paginationList.push(config.pageCount);
                    }
                    else if (config.currentIndex > config.pageCount - offset) {
                        scope.paginationList.push(1);
                        scope.paginationList.push('...');

                        for (i = offset + 1; i >= 1; i--) {
                            scope.paginationList.push(config.pageCount - i);
                        }
                        scope.paginationList.push(config.pageCount);
                    }
                    else {
                        // 最后一种情况，两边都有...
                        scope.paginationList.push(1);
                        scope.paginationList.push('...');

                        for (i = Math.ceil(offset / 2) ; i >= 1; i--) {
                            scope.paginationList.push(config.currentIndex - i);
                        }
                        scope.paginationList.push(config.currentIndex);

                        for (i = 1; i <= offset / 2; i++) {
                            scope.paginationList.push(config.currentIndex + i);
                        }
                        scope.paginationList.push('...');
                        scope.paginationList.push(config.pageCount);
                    }
                }

                scope.$parent.config = config;
            }

            // prevPage
            scope.prevPage = function () {

                if (config.currentIndex > 1) {
                    config.currentIndex -= 1;
                }
                getPagination();

                if (config.onChange) {
                    config.onChange();
                }
            };

            // nextPage
            scope.nextPage = function () {

                if (config.currentIndex < config.pageCount) {
                    config.currentIndex += 1;
                }
                getPagination();

                if (config.onChange) {
                    config.onChange();
                }
            };

            // 变更当前页
            scope.changecurrentIndex = function (item) {

                if (item == '...') {
                    return;
                }
                else {
                    config.currentIndex = item;
                    getPagination();

                    // config.onChange()函数
                    if (config.onChange) {
                        config.onChange();
                    }
                }
            };

            // 修改每页展示的条数
            scope.changepageSize = function () {

                // 一发展示条数变更，当前页将重置为1
                config.currentIndex = 1;

                getPagination();

                // config.onChange()函数
                if (config.onChange) {
                    config.onChange();
                }
            };

            // 跳转页
            scope.jumpToPage = function () {
                index = scope.jumpPageIndex;

                if (index.match(/\d+/)) {
                    index = parseInt(index, 10);

                    if (index && index != config.currentIndex) {

                        if (index > config.pageCount) {
                            index = config.pageCount;
                        }

                        // 跳转
                        config.currentIndex = index;
                        getPagination();
                        // config.onChange()函数

                        if (config.onChange) {
                            config.onChange();
                        }
                        scope.jumpPageIndex = '';
                    }
                }

            };
            scope.jumpPageKeyUp = function (e) {
                var keycode = window.event ? e.keyCode : e.which;

                if (keycode == 13) {
                    scope.jumpToPage();
                }
            }

            scope.$watch('config.totalCount', function (value, oldValue) {

                // 在无值或值相等的时候，去执行onChange事件
                if (!value||value==oldValue) {

                    if (config.onChange) {
                        config.onChange();
                    }
                }
                getPagination();
            });
        }
    };
}]);