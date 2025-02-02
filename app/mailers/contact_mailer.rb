class ContactMailer < ActionMailer::Base

  default :from => SITE_SETTINGS["Email"]
  default :to => SITE_SETTINGS["Email"]

  def new(contact)
    @contact = contact
    mail :cc => SITE_SETTINGS["Email CC"], :subject => "Physio Med Clinics Website - Contact form completed"
  end

  def new_practice_application(practice_application, request)
    @practice_application = PracticeApplication.includes(:practitioners).find(practice_application.id)
    @request = request
    
    unless SITE_SETTINGS["Practice Application Email"].blank?
      mail :to => SITE_SETTINGS["Practice Application Email"], :cc => SITE_SETTINGS["Email CC"], :subject => "Physio Med Clinics Website - Practice form completed"
    else
      mail :cc => SITE_SETTINGS["Email CC"], :subject => "Physio Med Clinics Website - Practice form completed"  
    end
  end

end
