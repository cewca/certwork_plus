// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require s3_direct_upload
//= require bootstrap/dist/js/bootstrap
//= require bootstrap/js/alert
//= require jquery_validation/dist/jquery.validate
//= require bootstrap.file-input
//= require knockout/dist/knockout
//= require jquery-ui/jquery-ui
//= require moment/moment
//= require viewmodels/MessagesViewModel
//= require viewmodels/AssessmentPlanViewModel
//= require viewmodels/UploadViewModel
//= require jquery-file-upload/js/jquery.fileupload
//= require global

ko.bindingHandlers.datepicker = {
    init: function(element, valueAccessor, allBindingsAccessor) {
        
        var $el = $(element);
        
        //initialize datepicker with some optional options
        var options = allBindingsAccessor().datepickerOptions || {};
        $el.datepicker(options);

        //handle the field changing
        ko.utils.registerEventHandler(element, "change", function() {
            var observable = valueAccessor();
            observable($el.datepicker("getDate"));
        });

        //handle disposal (if KO removes by the template binding)
        ko.utils.domNodeDisposal.addDisposeCallback(element, function() {
            $el.datepicker("destroy");
        });

    },
    update: function(element, valueAccessor) {

        var value = ko.utils.unwrapObservable(valueAccessor()),
            $el = $(element),
            current = $el.datepicker("getDate");
        
        if (value - current !== 0) {
            $el.datepicker("setDate", value);   
        }
    }
};
