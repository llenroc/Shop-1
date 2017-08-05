(function () {
    appModule.controller('app.manager.tenant.dashboard.index', [
        '$scope', 'infrastructure.services.app.tenantDashboard', 'infrastructure.services.app.systemMonitor',
        function ($scope, tenantDashboardService, systemMonitorService) {
            var vm = this;
            vm.orderCountToShip = 0;
            vm.orderCountOfYestoday = 0;
            vm.tradingVolumeOfYestoday = 0;
            vm.rebateOfYestoday = 0;

            $scope.$on('$viewContentLoaded', function () {

            });

            //Connect to the server
            infrastructure.signalr.connect = function () {
                $.connection.hub.start().done(function () {
                    infrastructure.event.trigger('infrastructure.signalr.connected');
                    commonHub.server.register().done(function () {
                        infrastructure.log.debug('Registered to the SignalR server!'); //TODO: Remove log
                    });
                });
            };
            var gaugeOptions = {
                chart: {
                    type: 'solidgauge'
                },
                title: null,
                pane: {
                    center: ['50%', '85%'],
                    size: '140%',
                    startAngle: -90,
                    endAngle: 90,
                    background: {
                        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                        innerRadius: '60%',
                        outerRadius: '100%',
                        shape: 'arc'
                    }
                },
                tooltip: {
                    enabled: false
                },
                // the value axis
                yAxis: {
                    stops: [
                        [0.1, '#55BF3B'], // green
                        [0.5, '#DDDF0D'], // yellow
                        [0.9, '#DF5353'] // red
                    ],
                    lineWidth: 0,
                    minorTickInterval: null,
                    tickPixelInterval: 400,
                    tickWidth: 0,
                    title: {
                        y: -70
                    },
                    labels: {
                        y: 16
                    }
                },
                plotOptions: {
                    solidgauge: {
                        dataLabels: {
                            y: 5,
                            borderWidth: 0,
                            useHTML: true
                        }
                    }
                }
            };

            var userChart;
            var orderChart;

            vm.getDashboardActivity = function () {
                tenantDashboardService.getDashboardActivity({}).success(function (result) {
                    vm.orderCountToShip = result.orderCountToShip;
                    vm.orderCountOfYestoday = result.orderCountOfYestoday;
                    vm.tradingVolumeOfYestoday = result.tradingVolumeOfYestoday;
                    vm.rebateOfYestoday = result.rebateOfYestoday;

                    var userCategories = [];
                    var userData = [];

                    var orderCategories = [];
                    var orderData = [];

                    result.userActivity.newUsers.forEach(function (newUser) {
                        userCategories.push(newUser.date);
                        userData.push(newUser.count);
                    });


                    result.orderActivity.newPayedOrders.forEach(function (newOrder) {
                        orderCategories.push(newOrder.date);
                        orderData.push(newOrder.count);
                    });

                    if (userChart) {
                        userChart.series[0].remove();
                        userChart.addSeries({ 
                            name: app.localize('NewUsers'),  
                            data: userData 
                        });
                    }
                    else {
                        userChart = new Highcharts.Chart({
                            chart: {
                                renderTo: 'usersChart',
                                type: 'line'                         //指定图表的类型，默认是折线图（line）
                            },
                            title: {
                                text: app.localize('Users')     //指定图表标题
                            },
                            xAxis: {
                                categories: userCategories   //指定x轴分组
                            },
                            yAxis: {
                                title: {
                                    text: app.localize('Count')               //指定y轴的标题
                                }
                            },
                            series: [{                                 //指定数据列
                                name: app.localize('NewUsers'),                          //数据列名
                                data: userData                      //数据
                            }]
                        })
                    }

                    if (orderChart) {
                        orderChart.series[0].remove();
                        orderChart.addSeries({
                            name: app.localize('NewOrders'),
                            data: orderData
                        });
                    }
                    else {
                        orderChart = new Highcharts.Chart({
                            chart: {
                                renderTo: 'orderChart',
                                type: 'line'                         //指定图表的类型，默认是折线图（line）
                            },
                            title: {
                                text: app.localize('Orders')      //指定图表标题
                            },
                            xAxis: {
                                categories: orderCategories   //指定x轴分组
                            },
                            yAxis: {
                                title: {
                                    text: app.localize('Count')                   //指定y轴的标题
                                }
                            },
                            series: [{                                 //指定数据列
                                name: app.localize('NewOrders'),                          //数据列名
                                data: orderData                      //数据
                            }]
                        });
                    }
                });
            };
            function intialize() {
                vm.getDashboardActivity();
            }
            intialize();
        }
    ]);
})();