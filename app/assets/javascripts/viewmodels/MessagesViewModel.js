 var p101 = p101 || {}
 p101.viewmodels = p101.viewmodels || {}

 p101.viewmodels.MessagesViewModel = function(messages) {
 	var empty_message = {from_username: "_", to_username:"_", subject:"_",body:"_", localTime: function() {},read:false,checked:false};
 	var messagesArray = ko.observableArray();
 	var selected_message = ko.observable(empty_message);
    var _draft_message = function() {
        var _to= ko.observable("");
        var _subject= ko.observable("");
        var _body= ko.observable("");
        var _clear = function() {
                _to("");
                _subject("");
                _body(""); 
        };
        var _cancel = function() {
            $("#compose_modal").modal("hide");
            _clear();
            $("#compose_modal form").validate().resetForm()
        };
        return {
            to:_to,
            subject:_subject,
            body: _body,
            cancel: _cancel,
            send: function() {
                if ($("#compose_modal form").valid()) {
                    $.ajax({
                        url: '/messages',
                        type: 'POST',
                        data: {message: {to:_draft_message.to, subject: _draft_message.subject(), body: _draft_message.body()}},
                        success: function(result) {
                           
                     
                          for (var i =0 ; i < result.errors.length; i++) {
                             console.log(result.errors[i])
                            $("#compose_modal .errors").append("<div class='alert alert-danger'>"+result.errors[i]+"</div>")
                          }

                          if (result.errors.length ==0) {
                            _cancel();
                          }
                          
                        }
                    });
                }

            }
        }

    }();
 	var self = this;

 	var unread = ko.computed(function() {
 		    var total = 0;

            ko.utils.arrayForEach(messagesArray(), function (msg) {
            	var read = msg.read();
                if (!read) {
                	total +=1 ;
                }
                
            });

            return total;
 	});

    var checked_messages = ko.computed(function() {
            var rt = [];

            ko.utils.arrayForEach(messagesArray(), function (msg) {
              
                if (msg.checked()) {
                    rt.push(msg);
                }
               
                
                
            });

            
      
            return rt;
    });

 	for(var i=0; i < messages.length; i++) {
 		messages[i].localTime = localTime;
 		messages[i].checked = ko.observable(false)
 		messages[i].read = ko.observable(messages[i].read||false)
 		messagesArray.push(messages[i]);
 	}

    

    function localTime() {
	 	return moment(this.created_at).format('lll');
	}

	function openMessage(msg) {
		
		selected_message(msg);
		$("#message_modal.modal").modal("show");
        if (!msg.read()==true){
            $.ajax({
                url: '/messages/'+msg.id,
                type: 'PUT',
                success: function(result) {
                    msg.read(true);
                }
            });
        }
	}

    function remove_messages(ids) {
        var targets = []
        ko.utils.arrayForEach(messagesArray(), function (msg) {
              
                if (msg.checked()) {
                    targets.push(msg)
                }
        });

        messagesArray.removeAll(targets);
    }

    function _delete() {
        var ids =[];
        ko.utils.arrayForEach(checked_messages(), function (msg) {
                    ids.push(msg.id);             
        });
        
        if (checked_messages().length > 0) {
            if (window.confirm("Do you really want to delete these messages?")) { 
                $.ajax({
                    url: '/messages/0',
                    type: 'DELETE',
                    data: {message_ids: ids},
                    success: function(result) {
                      
                    }
                });

                remove_messages(ids);
            }
        }
    }

    function _onCompose() {
        $("#compose_modal").modal("show");
    }

    function _onReply() {
        var rmsg = checked_messages()[0];
        console.log(_draft_message, _draft_message.to);
        _draft_message.to(rmsg.from_username);
        _draft_message.subject("Re: "+rmsg.subject)
        _draft_message.body("\n\nIn reply "+rmsg.localTime() + " "+ rmsg.from_username+" wrote:\n-------------------\n"+rmsg.body)
        $("#compose_modal").modal("show");
    }

    function _onForward() {
        var rmsg = checked_messages()[0];
        console.log(_draft_message, _draft_message.to);
        _draft_message.to(rmsg.from_username);
        _draft_message.subject("Fw: "+rmsg.subject)
       
        _draft_message.body(rmsg.localTime() + " "+ rmsg.from_username+" wrote:\n-------------------\n"+rmsg.body)
        $("#compose_modal").modal("show");
    }

    return {
        messages: messagesArray,
        onOpen: openMessage,
        selected_message: selected_message,
        unread: unread,
        checked_messages: checked_messages,
        delete_messages: _delete,
        onCompose:_onCompose,
        onReply: _onReply,
        onForward: _onForward,
        draft_message: _draft_message

    }
 }


