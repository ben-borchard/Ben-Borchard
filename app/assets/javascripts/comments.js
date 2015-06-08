
$(document).ready(function() {
	
	var disableBtnCheck = function() {
		if ( $('#post-body').val() !== "" && 
			 $('#post-author').val() !== "" && 
			 !$('#post-btn').hasClass("btn-disable") )

			$('#post-btn').removeClass("disabled");
		else	
			$('#post-btn').addClass("disabled");
	}

	/* 0-timeout to get the already changed text */
    function delayedDisableBtnCheck () {
        window.setTimeout(disableBtnCheck, 0);
    }

    function update() {
    	$('#post-body').css('height', 'auto');
        $('#post-body').css('height', $('#post-body').prop('scrollHeight')+'px');

        disableBtnCheck();
    }

    /* 0-timeout to get the already changed text */
    function delayedUpdate () {
        window.setTimeout(update, 0);
    }

    $('#post-author').on('change',  disableBtnCheck);
    $('#post-author').on('cut',     delayedDisableBtnCheck);
    $('#post-author').on('paste',   delayedDisableBtnCheck);
    $('#post-author').on('drop',    delayedDisableBtnCheck);
    $('#post-author').on('keydown', delayedDisableBtnCheck);

    $('#post-body').on('change',  update);
    $('#post-body').on('cut',     delayedUpdate);
    $('#post-body').on('paste',   delayedUpdate);
    $('#post-body').on('drop',    delayedUpdate);
    $('#post-body').on('keydown', delayedUpdate);

    /*
     * Post button functionality
     */

	var unhide = function() {
		$('#post-btn').removeClass("hide");
		$('#post-btn-cancel').removeClass("hide");
	}

	var hide = function() {
		$('#post-body').val("");
		$('#post-btn').addClass("hide");
		$('#post-btn-cancel').addClass("hide");
		if (!$('#post-btn').hasClass("disabled")){
			$('#post-btn').addClass("disabled");
		}
	}

	if ($('#post-body').is(":focus")){
		unhide()
	}

	$('#post-body').focus(unhide);
	$('#post-body').focusout(function() {
		if ($(this).val() === "")
			hide();
	});

	$('#post-btn-cancel').click(hide);


	var shiftDown = false;

	$('#post-body').keydown(function(key){

		/* Shift */
		if (key.which === 16){
			shiftDown = true;
		}

		/* Enter */
		if (key.which === 13 && !shiftDown){
			if (!$('#post-btn').hasClass('disabled'))
				$('#post-btn').click()
			key.preventDefault()
		}

		/* Esc */
		if (key.which === 27){
			$(this).blur();
			$('#post-btn-cancel').click()
			key.preventDefault()
		}

	});

	$('#post-body').keyup(function(key){

		/* Shift */
		if (key.which === 16){
			shiftDown = false;
		}

	});

	$('#new_comment').on('ajax:success', function(e, data, status, xhr){
		$(xhr.responseText).hide().prependTo($('.comments')).show('slow');
		hide();
		$(this).find('textarea').blur();
		$('#num-comments').html(parseInt($('#num-comments').html())+1);
	})


	

});