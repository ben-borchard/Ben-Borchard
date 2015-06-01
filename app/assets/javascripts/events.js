

$(document).ready(function(){

      var fnew = function(start) {
        
        var url = $('#new_event').attr('href')
        if (typeof start !== undefined){
          url += '?start='+encodeURIComponent(start);
        }
        console.log(url)
        $.ajax({
          url: url
        });
      };

      
      $('#new_event').click(function(event){
        event.preventDefault();
        fnew()
      })

      // page is now ready, initialize the calendar...
      $('#calendar').fullCalendar({
          editable: true,
          header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,agendaDay'
          },
          defaultView: 'agendaWeek',
          height: 500,
          slotMinutes: 15,
          //events: "/events/get_events",
          timeFormat: 'h:mm t{ - h:mm t} ',
          dragOpacity: "0.5",
          dayClick: function(date){
            fnew(date.format())
          }

          /*function(date, jsEvent, view) {

            alert('Clicked on: ' + date.format());

            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

            alert('Current view: ' + view.name);

            // change the day's background color just for fun
            $(this).css('background-color', 'red');

        }*/
      
      });
  });
