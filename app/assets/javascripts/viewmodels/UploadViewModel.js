var p101 = p101 || {}
p101.viewmodels = p101.viewmodels || {}
p101.viewmodels.EvidenceOptionHast = {
	
		"wt-doc": "Witness testimony document(doc,txt,pdf)",
 		"wt-audio": "Witness testimony audio(mp3, wav)",
 		"wt-img": "Witness testimony image(jpg, bmp, png)",
 		"wt-video": "Witness testimony video(mp4)"
 	
}
p101.viewmodels.UploadViewModel = function(evidences) {
	var empty_indicator= {id:-1, indicator_name:"", status:"",evidence_filename: ko.observable(),
	 			evidence_url:  ko.observable(),
	 			comments: "",evidence_option:""}
 	var _evidences = ko.observableArray();
 	var _selected_indicator = ko.observable(empty_indicator);
 	if (assessment_plan && assessment_plan.assessment_indicators) {
		for(var i =0 ; i < assessment_plan.assessment_indicators.length; i++) {
			var indicator = assessment_plan.assessment_indicators[i]
			console.log(indicator);
			var item = {
				id: indicator.id,
        obj_key: ko.observable(indicator.obj_key),
				indicator_name: indicator.name,
				status: "pending",
	 			evidence_filename: ko.observable(indicator.evidence_filename),
	 			evidence_url:  ko.observable(indicator.evidence_url),
	 			comments: indicator.comment,
	 			evidence_option: p101.viewmodels.EvidenceOptionHast[indicator.evidence_option]

	 		}
	
	 		_evidences.push(item);
		}
	}

$(function() {
  
        var fileInput    = $("#evidence_upload_form #file_upload_input");
        var form         = $(fileInput.parents('form:first'));
        var submitButton = form.find('input[type="submit"]');
        var progressBar  = $("<div class='bar'></div>");
        var barContainer = $("<div class='progress'></div>").append(progressBar);
        var _context = null;
        fileInput.after(barContainer);
        fileInput.fileupload({
          fileInput:       fileInput,
          url:             s3_direct_post_url,
          type:            'POST',
          autoUpload:       false,
          formData:         s3_direct_post_formdata,
          paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
          dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
          replaceFileInput: false,
            
          progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            progressBar.css('width', progress + '%')
          },
          add: function (e, data) {
            _context = data;
            data.context = $("#file_upload_modal #file_upload_foot #file_upload_btn")
                .off('click')
                .text("Upload")
                .prop('disabled', false)
                .show()
                .click(function () {
                    $("#file_upload_modal #file_upload_foot #file_upload_btn").prop('disabled', true);
                    data.submit();
                });
          },
          start: function (e) {
 
            progressBar.
              css('background', 'green').
              css('display', 'block').
              css('width', '0%');
          },
          done: function(e, data) {
            var location   = $(data.jqXHR.responseXML).find("Location").text();
            var key   = $(data.jqXHR.responseXML).find("Key").text();

            var filename = fileInput.val();
            _selected_indicator().evidence_url(location);
            _selected_indicator().obj_key(key);
            _selected_indicator().evidence_filename(filename);
            if (_context) {
                _context.context = null;
            }

          	$.ajax({
          		url: '/assessment_indicators/'+_selected_indicator().id,
        				dataType:'json',
        				type:"PUT",
        				contentType: "application/json",
                data: JSON.stringify({indicator:ko.toJSON(_selected_indicator)})
              }).
              success(function() {

		            $("#file_upload_modal #file_upload_foot #file_upload_btn")
		            .prop('disabled', false)
		            .text("Done")
		            .click(function() {
		              
		              progressBar.
		              css('background', 'none').
		              css('display', 'block').
		              css('width', '0%').
		              text("");
		              progressBar.text("");
		              $("#file_upload_modal").modal("hide");
		              
		            })
          		}).
          		fail(function() {
          			$("#file_upload_modal #file_upload_foot #file_upload_btn").prop('disabled', false).text("Retry");

		            progressBar.
		              css("background", "red").
		              text("Failed");
          		});
          },
          fail: function(e, data) {
            $("#file_upload_modal #file_upload_foot #file_upload_btn").prop('disabled', false).text("Retry");

            progressBar.
              css("background", "red").
              text("Failed");
            
            
          }

        });
    
  });

	return {
 		evidences: _evidences,
 		selected_indicator: _selected_indicator,
 		upload_file:  function(ev) {
 			_selected_indicator(ev);
			$("#evidence_upload_form #file_upload_input").val("");
            $("#file_upload_modal #file_upload_foot button").prop('disabled',true);
            $(".progress .bar").removeAttr("style");
 			$("#file_upload_modal").modal("show");


 		},
    delete_file: function(ev) {
      _selected_indicator(ev);
      $.ajax({
              url: '/assessment_indicators/'+_selected_indicator().id,
              type:'DELETE'
            }).
      done(function(){
        ev.evidence_filename(""),
        ev.evidence_url("")
      }).
      fail(function(){

      })
    }
 	}
}