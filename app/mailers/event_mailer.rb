class EventMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def notify_event(member, event)
    @member = member
    @event = event
    mail(to: @member.email, subject: event.title)
  end
end
