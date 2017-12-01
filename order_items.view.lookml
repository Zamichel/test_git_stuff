- view: order_items
  fields:

# DIMENSIONS #

  - dimension: id
    type: int
    primary_key: true
    sql: ${TABLE}.id

  - dimension: inventory_item_id
    type: int
    sql: ${TABLE}.inventory_item_id
    hidden: true

  - dimension: return_date
    type: date
    sql: ${TABLE}.returned_at

  - dimension: returned
    type: yesno
    sql: ${TABLE}.returned_at IS NOT NULL

  - dimension: order_id
    type: int
    sql: ${TABLE}.order_id
    hidden: true

  - dimension: sale_price
    description: The sale price reflects the price that the item was sold at.
    type: number
    decimals: 2
    sql: ${TABLE}.sale_price


# MEASURES #

  - measure: count
    type: count
    drill_fields: detail


  - measure: total_sale_price
    type: sum
    sql: ${sale_price}
    value_format: '$#,##0.00'

  - measure: sale_price_per_item
    type: number
    sql: 100.00 * ${total_sale_price} / NULLIF(${count},0)
    value_format: '#0.00\%'  



