Tabulous.setup do

  tabs do

    # g_cal_events_tab do
    #   text          { 'G Cal Events' }
    #   link_path     { g_cal_events_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('g_cal_events') }
    # end

    landing_tab do
      text          { 'Home' }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('landing') }
    end

    # payment_notifications_tab do
    #   text          { 'Payment Notifications' }
    #   link_path     { payment_notifications_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('payment_notifications') }
    # end




    schedule_tab do
      text          { 'Team Schedule' }
      link_path     { '#' }
      visible_when  { true }
      enabled_when  { true }
      active_when   { a_subtab_is_active }#in_action('any').of_controller('events') }
    end

    calendar_subtab do
      text          { 'Calendar' }
      link_path     { calendar_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('calendars') }
    end

    events_subtab do
      text          { 'Events' }
      link_path     { events_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('events') }
    end

    locations_subtab do
      text          { 'Locations' }
      link_path     { locations_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('locations') }
    end

    event_types_subtab do
      text          { 'Event Types' }
      link_path     { event_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('event_types') }
    end

    # event_responses_subtab do
    #   text          { 'Responses' }
    #   link_path     { event_responses_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('responses') }
    # end

    responses_subtab do
      text          { 'Attendance' }
      link_path     { responses_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('responses') }
    end

    payments_tab do
      text          { 'Payments' }
      link_path     { payments_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('payments') }
    end

    people_tab do
      text          { 'Team' }
      link_path     { people_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('people') }
    end

    # event_groups_tab do
    #   text          { 'Event Groups' }
    #   link_path     { event_groups_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('event_groups') }
    # end

    # event_users_tab do
    #   text          { 'Event Users' }
    #   link_path     { event_users_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('event_users') }
    # end

    # g_cals_tab do
    #   text          { 'Google Calendars' }
    #   link_path     { g_cals_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('g_cals') }
    # end

    # google_shared_calendars_tab do
    #   text          { 'Google Shared Calendars' }
    #   link_path     { google_shared_calendars_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('google_shared_calendars') }
    # end

    uploads_tab do
      text          { 'Multimedia' }
      link_path     { uploads_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('uploads') }
    end

    playbooks_tab do
      text          { 'Playbooks' }
      link_path     { playbooks_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('playbooks') }
    end

    # form_submission_items_tab do
    #   text          { 'Form Submission Items' }
    #   link_path     { form_form_field_form_submission_items_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('form_submission_items') }
    # end

    forms_tab do
      text          { 'Forms' }
      link_path     { '#' }
      visible_when  { true }
      enabled_when  { true }
      active_when   { a_subtab_is_active }#in_action('any').of_controller('forms') }
    end

    submit_subtab do
      text          { 'Submit' }
      link_path     { forms_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('forms') }
    end

    form_submissions_subtab do
      text          { 'Review/Edit' }
      link_path     { form_submissions_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('form_submissions') }
    end

    # form_fields_tab do
    #   text          { 'Form Fields' }
    #   link_path     { form_form_fields_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('form_fields') }
    # end





    # sextant_routes_tab do
    #   text          { 'Sextant Routes' }
    #   link_path     { rails_routes_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('sextant/routes') }
    # end

    # rails_mailers_tab do
    #   text          { 'Rails Mailers' }
    #   link_path     { rails_mailers_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('rails/mailers') }
    # end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    render_subtabs_when_empty false
  renderer :bootstrap
  active_tab_clickable true

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  # use_css_scaffolding 
  # do
  #     # background_color '#ccc'
  #     # text_color '#444'
  #     # active_tab_color '#fff'
  #     # hover_tab_color '#ddd'
  #     # inactive_tab_color '#aaa'
  #     # inactive_text_color '#888'
  # end


end
