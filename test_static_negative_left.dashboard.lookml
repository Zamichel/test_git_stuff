- dashboard: test_test
  layout: static 
  tile_size: 100 
  width: 600
  
  filters: 

  elements: 
  # --------------------- 
  # Row 1 0,0 & 0,4 to 12,0 & 12,4 
  # --------------------- 
  - name: client 
    title: client 
    left: -3 
    top: 0 
    width: 6 
    height: 2 
    type: single_value 
    model: mg_redshift 
    explore: employee 
    dimensions: [client.client] 
    listen: 
    client: client.client 
    sorts: [client.client] 
    limit: 500 
    column_limit: '' 
    font_size: medium 
    stacking: '' 
    show_value_labels: false 
    label_density: 25 
    legend_position: center 
    x_axis_gridlines: false 
    y_axis_gridlines: true 
    show_view_names: true 
    y_axis_combined: true 
    show_y_axis_labels: true 
    show_y_axis_ticks: true 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: true 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    ordering: none 
    show_null_labels: false
    
  - name: csm 
    title: Customer Success Manager 
    left: -3 
    top: 2 
    width: 6 
    height: 2 
    type: single_value 
    model: mg_redshift 
    explore: employee 
    dimensions: [sfdc_accounts.csm] 
    listen: 
    client: client.client 
    sorts: [sfdc_accounts.csm desc] 
    limit: 500 
    column_limit: '' 
    font_size: medium 
    stacking: '' 
    show_value_labels: false 
    label_density: 25 
    legend_position: center 
    x_axis_gridlines: false 
    y_axis_gridlines: true 
    show_view_names: true 
    y_axis_combined: true 
    show_y_axis_labels: true 
    show_y_axis_ticks: true 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: true 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    ordering: none 
    show_null_labels: false
    
  - name: destinations 
    title: Destinations 
    left: 3 
    top: 0 
    width: 6 
    height: 4 
    type: looker_geo_coordinates 
    model: mg_redshift 
    explore: employee 
    dimensions: [destination_city.city_location] 
    measures: [employee.total_employees] 
    listen: 
    client: client.client 
    sorts: [employee.total_employees desc] 
    limit: 500 
    column_limit: '' 
    stacking: '' 
    show_value_labels: false 
    label_density: 25 
    legend_position: center 
    x_axis_gridlines: false 
    y_axis_gridlines: true 
    show_view_names: true 
    y_axis_combined: true 
    show_y_axis_labels: true 
    show_y_axis_ticks: true 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: true 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    ordering: none 
    show_null_labels: false 
    map: world 
    map_projection: '' 
    loading: false
  
  # --------------------- 
  # Row 2: 0,4 to 12,4 
  # --------------------- 
  - name: open_files 
    title: Open files 
    left: -3 
    top: 4 
    width: 6 
    height: 4 
    type: looker_column 
    model: mg_redshift 
    explore: employee 
    dimensions: [client.client, policy_types.policy_type] 
    pivots: [policy_types.policy_type] 
    measures: [employee.total_employees] 
    filters: 
    employee.status: '"OPEN"' 
    listen: 
    client: client.client 
    sorts: [employee.total_employees desc 1, policy_types.policy_type] 
    limit: 500 
    column_limit: 50 
    font_size: small 
    stacking: normal 
    show_value_labels: true 
    label_density: 25 
    legend_position: right 
    x_axis_gridlines: false 
    y_axis_gridlines: false 
    show_view_names: false 
    y_axis_combined: true 
    show_y_axis_labels: false 
    show_y_axis_ticks: false 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: false 
    show_x_axis_ticks: false 
    x_axis_scale: auto 
    ordering: none 
    show_null_labels: false
    
  - name: authorisations_per_week 
    title: Authorisations per week 
    left: 3 
    top: 4 
    width: 6 
    height: 4 
    type: looker_area 
    model: mg_redshift 
    explore: date_analysis 
    dimensions: [date_analysis.date_week, employee_authorisations_policy_types.policy_type] 
    pivots: [employee_authorisations_policy_types.policy_type] 
    measures: [employee_authorisations.total_employees] 
    listen: 
    history: date_analysis.date_week 
    client: employee_moves_client.client 
    sorts: [date_analysis.date_week desc, employee_authorisations_policy_types.policy_type] 
    limit: 500 
    column_limit: 50 
    stacking: normal 
    show_value_labels: true 
    label_density: 25 
    legend_position: center 
    x_axis_gridlines: false 
    y_axis_gridlines: true 
    show_view_names: false 
    y_axis_combined: true 
    show_y_axis_labels: true 
    show_y_axis_ticks: true 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: false 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    show_null_points: true 
    point_style: none 
    interpolation: linear 
    y_axis_value_format: '0' 
    x_axis_label_rotation: 0
    
  # --------------------- 
  # Row 3: 0,4 to 12,4 
  # --------------------- 
  - name: hr_usage 
    title: HR usage 
    left: -3 
    top: 8 
    width: 6 
    height: 4 
    type: looker_area 
    model: mg_redshift 
    explore: hr_user 
    dimensions: [hr_initials.hr_initials, logins.login_date_week] 
    pivots: [hr_initials.hr_initials] 
    measures: [logins.total_logins] 
    filters: 
    logins.login_date_date: 28 days ago for 28 days 
    logins.login_date_week: 8 weeks 
    listen: 
    client: client.client 
    sorts: [logins.total_logins desc 1, hr_initials.hr_initials] 
    limit: 500 
    column_limit: 50 
    show_view_names: true 
    stacking: normal 
    show_value_labels: false 
    label_density: 25 
    legend_position: right 
    x_axis_gridlines: false 
    y_axis_gridlines: true 
    y_axis_combined: true 
    show_y_axis_labels: false 
    show_y_axis_ticks: true 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: false 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    show_row_numbers: true 
    show_null_points: true 
    point_style: none 
    interpolation: linear 
    ordering: none 
    show_null_labels: false 
    hide_legend: false
    
  - name: employee_feedback_scores 
    title: Employee feedback 
    left: 3 
    top: 8 
    width: 6 
    height: 4 
    type: looker_area 
    model: mg_redshift 
    explore: employee 
    dimensions: [employee.feedback_score_submitted_week] 
    measures: [employee.average_feedback_score, employee.total_feedback_scores] 
    filters: 
    employee.feedback_score: NOT NULL 
    employee.feedback_score_submitted_date: 28 days ago for 28 days 
    employee.feedback_score_submitted_week: 4 weeks 
    listen: 
    client: client.client 
    sorts: [employee.feedback_score_submitted_week desc, all_move_advocates.order] 
    limit: 500 
    column_limit: 50 
    stacking: '' 
    show_value_labels: true 
    label_density: 25 
    legend_position: right 
    x_axis_gridlines: false 
    y_axis_gridlines: false 
    show_view_names: false 
    y_axis_combined: true 
    show_y_axis_labels: false 
    show_y_axis_ticks: false 
    y_axis_tick_density: default 
    y_axis_tick_density_custom: 5 
    show_x_axis_label: false 
    show_x_axis_ticks: true 
    x_axis_scale: auto 
    show_null_points: true 
    point_style: none 
    interpolation: linear 
    ordering: none 
    show_null_labels: false 
    label_rotation: 0 
    label_value_format: '0.0' 
    series_types: 
    employee.total_feedback_scores: line 