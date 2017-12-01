- connection: thelook

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards
#
- explore: order_items
  access_filter_fields: [orders.id]
  joins:
    - join: inventory_items
      type: left_outer
      sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
      relationship: many_to_one

    - join: orders
      type: left_outer
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: many_to_one

    - join: products
      type: left_outer
      sql_on: ${inventory_items.product_id} = ${products.id}
      relationship: many_to_one

    - join: users
      type: left_outer
      sql_on: ${orders.user_id} = ${users.id}
      relationship: many_to_one
      
    - join: users_orders_facts
      type: left_outer
      relationship: many_to_one
      sql_on: ${users.id} = ${users_orders_facts.user_id}
       


# - explore: orders
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one
      
# - explore: inventory_items
#   joins:
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one
      




