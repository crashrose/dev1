class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_user_invitation(invitation)
    @invitation = invitation
    @reg_url  = new_user_registration_url(:invite_token => @invitation.token)
    @sign_in_url  = new_user_session_url(:invite_token => @invitation.token)
    # delivery_options = { user_name: company.smtp_user,
    #                      password: company.smtp_password,
    #                      address: company.smtp_host }
    mail(to: @invitation.email,
         subject: "Invation to join TeamRockett - new")
  end

  def existing_user_invitation(invitation)
    @invitation = invitation
    @sign_in_url  = new_user_session_url(:invite_token => @invitation.token)
    # delivery_options = { user_name: company.smtp_user,
    #                      password: company.smtp_password,
    #                      address: company.smtp_host }
    mail(to: @invitation.email,
         subject: "Invation to join TeamRockett - new")
  end

end
