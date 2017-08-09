$(function () {
    $.canknow.localization.addLanguage("zh", {
        Confirm: "确认",
        Close: "关闭",
        Ok: "确认"
    });
    $.canknow.localization.setCulture("zh");

    RichTextEditor.DefaultSettings.onImageUpload = function (files, editor) {
        editor.restoreSelection().focus();
        infrastructure.ui.setBusy();

        $.each(files, function (index, file) {

            if (/^image\//.test(file.type)) {
                var formData = new FormData();
                formData.append("file", file);

                var xhr = new XMLHttpRequest();
                xhr.open('POST', "/Manager/Home/Upload", true);
                //xhr.upload.addEventListener("progress", _this.settings.progress, false);
                xhr.addEventListener("load", function () {
                   
                }, false);
                xhr.addEventListener("error", function () {
                    infrastructure.ui.clearBusy();
                }, false);
                xhr.addEventListener("abort", function () {
                    infrastructure.ui.clearBusy();
                }, false);

                xhr.onreadystatechange = function () {

                    if (xhr.readyState == 4) {

                        if (xhr.status == 200) {
                            var result = JSON.parse(xhr.responseText);

                            if (result.success) {
                                editor.insertImage(result.result.path);
                            }
                            else {
                                infrastructure.message.error(result.error.detail);
                            }
                        }
                        infrastructure.ui.clearBusy();
                    }
                }
                xhr.send(formData);
            }
            else {

            }
        });
    }
});