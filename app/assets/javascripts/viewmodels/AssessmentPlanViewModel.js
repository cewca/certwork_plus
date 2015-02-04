var p101 = p101 || {}
p101.viewmodels = p101.viewmodels || {}
Date.now = Date.now || function() { return +new Date; };

p101.viewmodels.AssessmentPlanViewModel = function(assessment_plan) {
 
 	var _availableOptions = [{name: "Witness testimony document(doc,txt,pdf)", code: "wt-doc"},
 							{name: "Witness testimony audio(mp3, wav)", code: "wt-audio"},
 							{name: "Witness testimony image(jpg, bmp, png)", code: "wt-img"},
 							{name: "Witness testimony video(mp4)", code: "wt-video"}]
 	

	var _indicators = ko.observableArray();
	if (assessment_plan && assessment_plan.assessment_indicators) {
		for(var i =0 ; i < assessment_plan.assessment_indicators.length; i++) {
			var indicator = assessment_plan.assessment_indicators[i]

			var item = {
				id: indicator.id,
				name: indicator.name,
	 			selectedOption: ko.observable(),
	 			due_date:  ko.observable(new Date(indicator.due_date) || new Date("12/01/2015")),
	 			comment: indicator.comment			
	 		}
			
	 		if (indicator.evidence_option) {

	 			for(var j=0; j <_availableOptions.length; j++){
	 				
	 				
	 				if (_availableOptions[j].code == indicator.evidence_option) {
	 					item.selectedOption(_availableOptions[j]);
	 					
	 				}
	 			}
	 		}

	 		_indicators.push(item);
		}
	}

	function _onSave() {

		$.ajax({
			url: 'assessments/'+assessment_plan.id,
			type: 'PUT',
			dataType:'json',
			contentType: "application/json",
			data: JSON.stringify({assessment_plan: ko.toJSON(_indicators)}),
			success: function() {
				$(".flash").append('<div class="fade in alert alert-success "><div class="message">assessemnt plan has been saved successfully</div><a class="close" data-dismiss="alert" href="#">×</a></div>')
			}
		})
	}

	function _onSubmit() {

	}

 	return {
 		indicators: _indicators,
 		availableOptions: _availableOptions,
 		save: _onSave,
 		submit: _onSubmit
 	}
}

