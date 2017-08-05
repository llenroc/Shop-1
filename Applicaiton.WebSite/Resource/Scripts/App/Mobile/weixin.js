wxConfig = {};
wxConfig.jsApiList = [
    'checkJsApi',
    'onMenuShareTimeline',
    'onMenuShareAppMessage',
    'onMenuShareQQ',
    'onMenuShareWeibo',
    'hideMenuItems',
    'showMenuItems',
    'hideAllNonBaseMenuItem',
    'showAllNonBaseMenuItem',
    'translateVoice',
    'startRecord',
    'stopRecord',
    'onRecordEnd',
    'playVoice',
    'pauseVoice',
    'stopVoice',
    'uploadVoice',
    'downloadVoice',
    'chooseImage',
    'previewImage',
    'uploadImage',
    'downloadImage',
    'getNetworkType',
    'openLocation',
    'getLocation',
    'hideOptionMenu',
    'showOptionMenu',
    'closeWindow',
    'scanQRCode',
    'chooseWXPay',
    'openProductSpecificView',
    'addCard',
    'chooseCard',
    'openCard'
]; 

function initializeWxJs() {
    infrastructure.ajax({
        url: "/Mobile/Public/GetJsTicketParameters",
        type: "post",
        success: function (result) {
            wx.config({
                debug: false,
                appId: result.appId,
                timestamp: result.timestamp,
                nonceStr: result.nonceStr,
                signature: result.signature,
                jsApiList: wxConfig.jsApiList
            });
            wx.error(function (res) {
                console.log(res);
            });
        }
    });
}

function initShare(data) {
    var hasShare = false;
    var shareMetedata = {
        title: data.title,
        link: data.link?data.link:window.location.href,
        imgUrl: data.imgUrl,
        desc: data.desc
    };

    if (shareMetedata.link.indexOf("shareNo") > 0) {
        shareMetedata.link = shareMetedata.link.replace(/(?![?&])(shareNo)=\w+/gi, "&shareNo="+data.preShareData.no);
    }
    else if (shareMetedata.link.indexOf("?") > 0) {
        shareMetedata.link = shareMetedata.link + "&shareNo="+data.preShareData.no;
    }
    else{
        shareMetedata.link = shareMetedata.link + "?shareNo="+data.preShareData.no;
    }
    var postData = $.extend({ no: data.preShareData.no }, shareMetedata);

    shareMetedata.success = function (res) {

        if (!hasShare) {
            infrastructure.services.app.share.share(postData).done(function () {
                infrastructure.message.success(app.localize("YouShareSuccessfully"));

                if (data.callback) {
                    data.callback(result);
                }
                hasShare = true;
            });
        }
    };

    wx.ready(function () {
        wx.onMenuShareAppMessage(shareMetedata);//分享给朋友
        wx.onMenuShareTimeline(shareMetedata);//分享到朋友圈
    });
}