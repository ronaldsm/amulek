class CalendarsController < ApplicationController

  def show
    @weeks = 6
    @dates = get_day_data(start_date, @weeks)
    @companionship = Companionship.find(params[:id])
    @companionships = Companionship.all.order(label: :asc)
    @appointments = @companionship.appointments
    @dates = populate_appts_data(@dates)
  end

  def show_first
    redirect_to controller: 'calendars', action: 'show', id: Companionship.all.first
  end

  def start_date
    Date.today.beginning_of_week(:sunday)
  end

  def get_day_data(start_date, num_weeks)
    dates_data = []
    (num_weeks * 7).times do |i|
      data = {}
      data[:date] = start_date + i
      data[:week_no] = i / 7
      data[:day_no] = i % 7
      dates_data << data
    end
    dates_data
  end

  def populate_appts_data(dates_data)
    @appointments.each do |appt|
      dates_data.map do |d|
        next if d.nil?

        next unless appt[:date] == d[:date]

        d[:date] = appt[:date]
        d[:family] = appt[:family]
        d[:contact_info] = appt[:contact_info]
        d[:other_info] = appt[:other_info]
        d[:appointment_id] = appt[:id]
      end
    end
    dates_data
  end
end
