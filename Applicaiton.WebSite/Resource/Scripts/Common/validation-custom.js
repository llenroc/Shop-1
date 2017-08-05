(function ($) {

    if (!$.formValidate) {
        return;
    }

    $.formValidate.setDefaults({
        errorElement: 'span',
        errorClass: 'validate-message validate-message-validation-error',
        submitOnKeyPress: true,
        highlight: function ($element,message) {
            this.$helpBlock && this.$helpBlock.remove();

            if ($element.is(".input-wrapper")) {
                this.$helpBlock = $("<label>").addClass("validate-message").text(message).appendTo($element);
            }
        },
        unhighlight: function ($element) {
            this.$helpBlock && this.$helpBlock.remove();
        },
        submitHandler: function (form) {
            $(form).find('.alert-danger').hide();
        }
    });
})(jQuery);