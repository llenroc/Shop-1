(function () {
    appModule.controller('app.manager.user.statistics', [
        '$scope', 'infrastructure.services.app.user',
        function ($scope, userService) {
            var vm = this;
            var userSourceChart= echarts.init(document.getElementById('userSourceChart'));
            vm.getUserSource = function () {
                userService.getUserStatistics().success(function (result) {
                    var option = {
                        title: {
                            text: '用户访问来源',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: []
                        },
                        series: [
                            {
                                name: '访问来源',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: [],
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };

                    result.forEach(function (userSourceStatistics) {
                        option.legend.data.push(userSourceStatistics.userSource);
                        option.series[0].data.push({
                            name: userSourceStatistics.userSource,
                            value: userSourceStatistics.count
                        })
                    });
                    userSourceChart.setOption(option);
                })
            }

            function intialize() {
                vm.getUserSource();
            }
            intialize();
        }
    ]);
})();