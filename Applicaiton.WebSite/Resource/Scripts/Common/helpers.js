var app = app || {};
(function () {
    app.downloadTempFile = function (file) {
        location.href = infrastructure.appPath + 'File/DownloadTempFile?fileType=' + file.fileType + '&fileToken=' + file.fileToken + '&fileName=' + file.fileName;
    };

    app.getTimeDifference = function (fromTime, toTime, period) {

        if (!moment) {
            return null;
        }
        var from = moment(fromTime);
        var to = moment(toTime);
        return to.diff(from, period);
    }
})();