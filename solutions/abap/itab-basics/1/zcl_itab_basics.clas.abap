CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    "add solution here
    data ls_init type initial_type.
    ls_init-group = 'A'.
    ls_init-number = 10.
    ls_init-description = 'Group A-2'.
    append ls_init to initial_data.

    ls_init-group = 'B'.
    ls_init-number = 5.
    ls_init-description = 'Group B'.
    append ls_init to initial_data.

    ls_init-group = 'A'.
    ls_init-number = 6.
    ls_init-description = 'Group A-1'.
    append ls_init to initial_data.

    ls_init-group = 'C'.
    ls_init-number = 22.
    ls_init-description = 'Group C-1'.
    append ls_init to initial_data.

    ls_init-group = 'A'.
    ls_init-number = 13.
    ls_init-description = 'Group A-3'.
    append ls_init to initial_data.

    ls_init-group = 'C'.
    ls_init-number = 500.
    ls_init-description = 'Group C-2'.
    append ls_init to initial_data.
    
    
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    "add solution here
    data ls_init type initial_type.
    ls_init-group = 'A'.
    ls_init-number = 19.
    ls_init-description = 'Group A-4'.
    append ls_init to updated_data.
    
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    "add solution here
    SORT updated_data BY group ascending number descending.
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
    "add solution here
    LOOP AT temp_data into data(ls_temp).
      IF ls_temp-number = 6.
        result_index = sy-tabix.
        EXIT.
      ENDIF.
    ENDLOOP.
        
  ENDMETHOD.

ENDCLASS.
