CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    " add solution here
    data: lv_group type group,
          lv_min type i,
          lv_last_group type group,
          ls_numbers type initial_numbers_type,
          ls_agg type aggregated_data_type.
    SORT initial_numbers by group ascending.
    READ TABLE initial_numbers into ls_numbers INDEX 1.
    lv_last_group = ls_numbers-group.
    lv_min = 999.
    
    LOOP AT initial_numbers into ls_numbers.
        IF lv_last_group NE ls_numbers-group.
          ls_agg-min = lv_min.
          append ls_agg to aggregated_data.
          clear ls_agg.
          lv_min = 999.
        ENDIF.
        ls_agg-group = ls_numbers-group.
        ls_agg-count = ls_agg-count + 1.
        ls_agg-sum   = ls_agg-sum + ls_numbers-number.
        
        IF ls_numbers-number < lv_min.
          lv_min = ls_numbers-number.
        ENDIF.
        
        IF ls_numbers-number > ls_agg-max.
          ls_agg-max = ls_numbers-number.
        ENDIF.
        ls_agg-average = ls_agg-sum / ls_agg-count.
        lv_last_group = ls_numbers-group.
    ENDLOOP.
    IF initial_numbers IS NOT INITIAL AND lv_last_group = ls_numbers-group.
      ls_agg-min = lv_min.
      append ls_agg to aggregated_data.
      clear ls_agg.
      lv_min = 999.
    ENDIF.

    
  ENDMETHOD.

ENDCLASS.
