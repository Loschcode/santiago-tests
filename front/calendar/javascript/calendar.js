/**
 * Calendar
 */
var Calendar = (function() {

  return {

    /**
     * Appointments given by the developer in the method `create()`
     * @type {Object}
     */
    _appointments: {},

    /**
     * Templates used to draw the agenda
     * @type {Object}
     */
    _templates: {

      cellDefault: '<div id="{id}" class="calendar__cell"></div>',
      cellHighlight: '<div class="calendar__cell calendar__cell--highlight">{value}</div>',
      cellHead: '<div class="calendar__cell calendar__cell--head">{value}</div>',
      cellHour: '<div class="calendar__cell calendar__cell--hour">{value}</div>'

    },

    /**
     * Days of the week
     * @type {Array}
     */
    _days: ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'],

    /**
     * Set the appointments data to create the calendar
     * @param  {Object} appointments Datas (name, start, end)
     * @return {Object} Chaining
     */
    create: function(appointments) {

      if (appointments) {
        this._appointments = appointments;
      }

      this._hours = this._createHours();

      return this;
    },

    /**
     * Draw the calendar based on the datas given in create
     * @return void
     */
    draw: function() {

      this._drawHeads()._drawHours()._drawCells()._drawAppointments();

    },

    /**
     * Create an array which starts by '08:00' to '19:30' 
     * @return {Array}
     */
    _createHours: function() {

      hours = [];

      for (var i = 8; i <= 19; i++) {
        hours.push(this._leftPadHour(i + ':00'));
        hours.push(this._leftPadHour(i + ':30'));
      }

      return hours;
    },

    /**
     * Handy function to fill one zero at the left when needed
     * @example
     *  8:00 -> 08:00
     * @param  {String} string
     * @return {String} The string `leftpaded`
     */
    _leftPadHour: function(string) {
      return ('0' + string).slice(-5)
    },

    /**
     * Draw the columns hours (left & right)
     * @return {Object} Chaining
     */
    _drawHours: function() {

      for (hour of this._hours) {

        template = this._templates.cellHour.split('{value}').join(hour);

        document.getElementById('hours-left').innerHTML += template;
        document.getElementById('hours-right').innerHTML += template;

      }

      return this;

    },

    /**
     * Draw the heads of hours and days
     * @return {Object} Chaining
     */
    _drawHeads: function() {

      // Draw head hours
      document.getElementById('hours-left').innerHTML = this._templates.cellHead.split('{value}').join('');
      document.getElementById('hours-right').innerHTML = this._templates.cellHead.split('{value}').join('');

      for (day of this._days) {
        
        // Draw head day
        document.getElementById('col-' + day).innerHTML = this._templates.cellHead.split('{value}').join(day);

      }

      return this;

    },

    /**
     * Draw the blank cells with a DOM relation 1 = 1 for later use
     * @return {Object} Chaining
     */
    _drawCells: function() {

      for (day of this._days) {
        
        for (hour of this._hours) {

          id = day + '-' + this._convertInMinutes(hour);

          document.getElementById('col-' + day).innerHTML += this._templates.cellDefault.split('{id}').join(id);

        }

      }

      return this;

    },

    /**
     * Draw appointment in the calendar
     * @param  {String} day  The day where to set the appointment
     * @param  {Int} minutes At which minute of the day we set the appointment
     * @param  {String} name    The name
     * @return void
     */
    _drawAppointment: function(day, minutes, name) {

      var selector = day + '-' + minutes;

      document.getElementById(selector).innerHTML = name;
      document.getElementById(selector).className += " calendar__cell--highlight"

    },


    /**
     * Draw each appointments on the calendar
     * @return void
     */
    _drawAppointments: function() {

      for (day in this._appointments) {

        for (appointment of this._appointments[day]) {
          
          var start = this._convertInMinutes(appointment.start);
          var end = this._convertInMinutes(appointment.end);
          var countdown = start;

          for (;countdown <= end; countdown += 30) {

            this._drawAppointment(day, countdown, appointment.name);
          }


        }

      }

    },

    /**
     * Convert in minutes the time string given
     * @example
     * 0:00 -> 0
     * 0:30 -> 30
     * 24:00 -> 1440
     * 
     * @param  {String} time The time string (10:30)
     * @return {Int} The time string in minutes
     */
    _convertInMinutes: function(time) {

      [hours, minutes] = time.split(':');

      // Hours (factor 60), Minutes (factor 1)
      return parseInt(hours) * 60 + parseInt(minutes) * 1;

    }


  };

})();

