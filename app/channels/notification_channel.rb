# app/channels/booked_notification_channel.rb
class NotificationChannel < ApplicationCable::Channel
    def subscribed
      stream_from "notifications"
    end
  end
  