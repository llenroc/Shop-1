(function () {
    appModule.controller('app.manager.user.heatMap', [
        '$scope', 'infrastructure.services.app.user',
        function ($scope, userService) {
            var vm = this;
            var tianditu = "http://t1.tianditu.cn/DataServer?T=vec_c&X=210&Y=106&L=8";
            mapboxgl.accessToken = 'pk.eyJ1IjoibHh0aWFudGlhbiIsImEiOiJjaXd2ZjlkYnQwMTZvMnRtYWZnM2lpbHFvIn0.ef3rFZTr9psmLWahrqap2A';
            vm.getUserLocations = function () {
                userService.getUserLocations().success(function (result) {
                    var simple = {
                        "version": 8,
                        "sources": {
                            "tianditu": {
                                "type": "raster",
                                "tiles": [tianditu]
                            }
                        },
                        "layers": [
                            {
                                "id": "tianditu",
                                "type": "raster",
                                "source": "tianditu",
                            }
                        ]
                    };

                    var map = new mapboxgl.Map({
                        container: 'map',
                        center: [114.474297, 30.484116],
                        style: 'mapbox://styles/mapbox/streets-v9', //stylesheet location  
                        //style: simple,
                        zoom: 3
                    });
                    var features = [];
                    result.forEach(function (userLocation) {
                        features.push({
                            "type": "Feature",
                            "geometry": {
                                "type": "Point",
                                "coordinates": [userLocation.longitude, userLocation.latitude]
                            }
                        })
                    });
                    map.on('load', function () {
                        map.addSource("userLocationsSource", {
                            type: "geojson",
                            "data": {
                                "type": "FeatureCollection",
                                "features": features
                            }
                        });
                        map.addLayer({
                            "id": "points",
                            "type": "circle",
                            "source": "userLocationsSource",
                            "paint": {
                                "circle-radius": 10,
                                "circle-color": "red"
                            }
                        });
                    });
                });
            }

            function intialize() {
                vm.getUserLocations();
            }
            intialize();
        }
    ]);
})();