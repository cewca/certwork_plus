$(document).ready(function(){
	$('#profile input[type=file]').bootstrapFileInput();
	$("form#profile_editor #password_confirmation").rules('add', {equalTo:"#new_password", messages: {equalTo:"Password doesn't match the confirmation"}})
    $("button#update_profile").on('click', function() {
        $("button#update_profile").attr('disabled','disabled').text("Uploading ...");
        $("#profile_editor").submit();
    });

    inbox = new p101.viewmodels.MessagesViewModel(messages_from);
    sent = new p101.viewmodels.MessagesViewModel(messages_to);
    plan = new p101.viewmodels.AssessmentPlanViewModel(assessment_plan);
    evidences = new p101.viewmodels.UploadViewModel(assessment_plan);
    ko.applyBindings(inbox, $(".dashboard_tabs")[0]);
    ko.applyBindings(inbox, $(".dashboard_tabs")[1]);
    ko.applyBindings(inbox, $("#inbox")[0]);
    ko.applyBindings(plan, $("#plan")[0]);
    ko.applyBindings(evidences, $("#upload")[0]);
})



function checkPassword(pwd)
{

    re = /[0-9]/;
      if(!re.test(pwd)) {
        return "Error: password must contain at least one number (0-9)!";
    }

    re = /[a-z]/;
    if(!re.test(pwd)) {
        return "Error: password must contain at least one lowercase letter (a-z)!";
    }

    re = /[A-Z]/;
    if(!re.test(pwd)) {
        return "Error: password must contain at least one uppercase letter (A-Z)!";
    }

    return true;
 }

