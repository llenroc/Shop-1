(function () {
    appModule.controller('app.manager.areaAgent.areaAgency.map', [
        '$scope', 'infrastructure.services.app.areaAgencyForEnd', 'infrastructure.services.app.areaAgentForEnd',
        function ($scope, areaAgencyService, areaAgentService) {
            var vm = this;
            vm.areAgents = [];
            vm.getAreaAgents = function () {
                areaAgentService.getAll().success(function (result) {
                    vm.areAgents = result.items;
                    intializeChinaMap();
                });
            }
            var chinaMap = echarts.init(document.getElementById('chinaMap'));
            vm.getAreaAgencyMap = function () {
                areaAgencyService.getAreaAgencyMap().success(function (result) {
                    var series = [];
                    result.areaAgencyAreaMapGroups.forEach(function (areaAgencyAreaMapGroup) {
                        var serie = {
                            name: areaAgencyAreaMapGroup.areaAgentName,
                            type: 'map',
                            mapType: 'china',
                            roam: false,
                            label: {
                                normal: {
                                    show: true
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            data:[]
                        };
                        areaAgencyAreaMapGroup.areaAgencyAreaMaps.forEach(function (areaAgencyAreaMap) {
                            var item = {
                                name: areaAgencyAreaMap.provinceName.replace("省", "").replace("市", ""),
                                value: areaAgencyAreaMap.count
                            }
                            serie.data.push(item);
                        });
                        series.push(serie);
                    });
                    var option = chinaMap.getOption();
                    option.series = series;
                    chinaMap.setOption(option);
                });
            }
            function intializeChinaMap() {
                var areaAgentNames = [];
                vm.areAgents.forEach(function (areaAgent) {
                    areaAgentNames.push(areaAgent.name);
                })
                option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: areaAgentNames
                    },
                    visualMap: {
                        min: 0,
                        max: 2500,
                        left: 'right',
                        top: 'top',
                        text: ['高', '低'],           // 文本，默认为数值文本
                        calculable: true
                    },
                    series: [
                        {
                            name: app.localize("China"),
                            type: 'map',
                            mapType: 'china',
                            roam: false,
                            label: {
                                normal: {
                                    show: true
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                        },
                    ]
                };
                chinaMap.setOption(option);
                chinaMap.on('click', function (params) {
                    city = params.name;
                });

                vm.getAreaAgencyMap();
            }
            function intialize() {
                vm.getAreaAgents();
            }
            intialize();
        }
    ]);
})();