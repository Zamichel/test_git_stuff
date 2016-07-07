- connection: thelook

- explore: test
  hidden: true
  
- view: test
  derived_table:
    sql: |
      SELECT 1 as value,
        'a' as name
  fields:
  - dimension: name
    type: string

- dashboard: test_dash
  layout: tile
  hidden: true
  
  elements:
  
  - name: the_element
    explore: test
    type: single_value
    dimensions: [test.name]
    measures: []