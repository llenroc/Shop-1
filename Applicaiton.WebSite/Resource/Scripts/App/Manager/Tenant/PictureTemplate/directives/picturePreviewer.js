/* Used by edition and tenant features. 
 */
appModule.directive('picturePreviewer', [
    function () {
        return {
            scope: {
                pictureTemplate: '='
            },
            templateUrl: '/Areas/Manager/Views/Tenant/PictureTemplate/previewer.cshtml',
            link: function ($scope, element, attr) {
                var canvas = $(element).find("canvas")[0];
                var context = canvas.getContext("2d");
                var moveFlag = false;
                var startX, startY;
                var currentTragets;
                var ratio = 1;
                canvas.addEventListener('click', function (e) {
                    var p = getEventPosition(e);
                    $scope.draw(p);
                }, false);
                canvas.onmousedown = function (e) {
                    var p = getEventPosition(e);
                    startX = e.clientX - canvas.offsetLeft;
                    startY = e.clientY - canvas.offsetTop;
                    //moveFlag = true;
                    currentTragets = $scope.draw(p);
                };
                document.onmousemove = function (e) {

                    if (moveFlag && currentTragets) {
                        var x = e.clientX - canvas.offsetLeft;
                        var y = e.clientY - canvas.offsetTop;

                        currentTragets.forEach(function (parameter) {
                            parameter.coordinate.startX += (x - startX) * ratio;
                            parameter.coordinate.startY += (y - startX) * ratio;
                        });
                    }
                };
                canvas.onmouseup = function () {
                    moveFlag = false;
                };
                function getEventPosition(ev) {
                    var x, y;
                    x = ev.offsetX;
                    y = ev.offsetY;
                    return { x: x, y: y };
                };

                $scope.draw = function (p) {
                    var path = $scope.pictureTemplate.template;
                    var parameters = $scope.pictureTemplate.parameters;
                    var targets = [];
                    var img = new Image();
                    var width;
                    var height;

                    var absoluteWidth = canvas.offsetWidth;
                    var absoluteHeight = canvas.offsetHeight;

                    img.onload = function () {
                        width = canvas.width = img.width;
                        height = canvas.height = img.height;
                        ratio = width / absoluteWidth;
                        context.drawImage(img, 0, 0);

                        if (parameters) {
                            parameters.forEach(function (parameter) {

                                if (parameter.type == 1) {
                                    context.beginPath();
                                    context.rect(parameter.coordinate.startX, parameter.coordinate.startY, parameter.coordinate.width, parameter.coordinate.height);
                                    context.fillStyle = "red";
                                    context.fill();
                                }
                                else if (parameter.type == 0) {
                                    context.font = parameter.fontStyle.size + "px sans-serif";
                                    context.fillStyle = parameter.fontStyle.color;
                                    var text = parameter.value || "I am Sample";
                                    context.fillText(text, parameter.coordinate.startX, parameter.coordinate.startY);
                                }

                                if (p && context.isPointInPath(p.x * ratio, p.y * ratio)) {
                                    targets.push(parameter);
                                }
                            });
                        }
                    };
                    img.src = path;
                    return targets;
                };

                $scope.$watch('pictureTemplate', function (newValue, oldValue) {

                    if (newValue === oldValue) {
                        return;
                    }
                    $scope.draw();
                },true);
            }
        };
    }
]);