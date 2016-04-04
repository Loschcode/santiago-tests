/**
 * Init the calendar with dummy datas
 */
(function() {


  var appointments = {

    monday: [
      {name: 'Daniel', start: '08:00', end: '09:00'},
    ], 

    tuesday: [
      {name: 'Daniel', start: '08:00', end: '09:00'},
      {name: 'Daniel', start: '12:00', end: '15:30'},
    ],

    wednesday: [
      {name: 'James', start: '14:00', end: '19:30'},
    ],

    friday: [
      {name: 'Peter', start: '12:00', end: '13:30'},
    ], 

    saturday: [
    ],

    sunday: [
      {name: 'Laurent', start: '08:00', end: '08:30'},
      {name: 'Henry', start: '09:30', end: '10:00'}


    ]

  }

  Calendar.create(appointments).draw();


})(Calendar);