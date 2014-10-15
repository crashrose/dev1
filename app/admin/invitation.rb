ActiveAdmin.register Invitation  do

navigation_menu :configure

  controller do
    def scoped_collection
      Invitation.all
    end
    # helper :views
    def create
      @invitation = Invitation.new(permitted_params[:invitation]) # Make a new Invitation
      @invitation.sender_id = current_user.id # set the sender to the current user
      if new_was_successful = @invitation.save
        #if the user already exists
        if @invitation.recipient != nil 
          #send a notification email
          InvitationMailer.existing_user_invitation(@invitation).deliver

        ## Not including this as we want the user to confirm membership before adding to organization
          #Add the user to the user group
          # @invitation.recipient.user_groups.push(@invitation.user_group)
        else
          InvitationMailer.new_user_invitation(@invitation).deliver
        end
      else
        # oh no, creating an new invitation failed
      end
      respond_with [@invitation] do |format|
        format.html{
          if new_was_successful
            redirect_to(admin_invitations_path, :notice => 'The user was invited')
          else
            render 'new', :notice => 'Some input was not valid.'
          end
        }
      end
    end
  end

  permit_params :email, :name


  index do
    selectable_column
    column :name
    column :email_address
    column :status
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Invite New Team Member" do
      f.input :name
      f.input :email
    end
    f.actions
  end

end
