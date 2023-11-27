# class RemindersController < ApplicationController
#   before_action :authenticate_user!

#   def index
#     @reminders = Reminder.all
#   end

#   def show
#     @reminder = Reminder.find(params[:id])
#   end

#   def new
#     @reminder = Reminder.new
#   end

#   def create
#     @reminder = Reminder.new(reminder_params)
#     if @reminder.save
#       redirect_to @reminder
#     else
#       render 'new'
#     end
#   end

#   def edit
#     @reminder = Reminder.find(params[:id])
#   end

#   def update
#     @reminder = Reminder.find(params[:id])
#     if @reminder.update(reminder_params)
#       redirect_to @reminder
#     else
#       render 'edit'
#     end
#   end

#   def destroy
#     @reminder = Reminder.find(params[:id])
#     @reminder.destroy
#     redirect_to reminders_path
#   end

#   private

#   def reminder_params
#     params.require(:reminder).permit(:medication_frequency_id)
#   end
# end
