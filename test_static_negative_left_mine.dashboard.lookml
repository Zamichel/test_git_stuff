- dashboard: test_static_negative_left_mine
  title: Test Static Negative Left Mine
  layout: static
  tile_size: 100
  width: 600

#  filters:

  elements:

  - name: add_a_unique_name_1447681194694
    top: 0
    left: -3
    width: 2
    height: 2
    title: Untitled Visualization
    type: single_value
    model: the_look
    explore: order_items
    measures: [orders.count]
    sorts: [orders.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    
  - name: add_a_unique_name_1447681194695
    top: 0
    left: 3
    width: 6
    height: 2
    title: Untitled Visualization
    type: single_value
    model: the_look
    explore: order_items
    measures: [orders.count]
    sorts: [orders.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium

