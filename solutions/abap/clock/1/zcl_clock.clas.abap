CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.

    METHODS get
      RETURNING
        VALUE(result) TYPE string.

    METHODS add
      IMPORTING
        !minutes TYPE i.

    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.
* add solution here
    DATA: gv_time    TYPE string,
          gv_hours   TYPE i,
          gv_minutes TYPE i.

    METHODS set_time
      IMPORTING iv_hours   TYPE i
                iv_minutes TYPE i.

    METHODS format_answer.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.


  METHOD format_answer.

    DATA: lv_min_str  TYPE string,
          lv_hour_str TYPE string.

    IF gv_hours < 10.
      lv_hour_str = |0{ gv_hours }|.
    ELSE.
      lv_hour_str = |{ gv_hours }|.
    ENDIF.
    IF gv_minutes < 10.
      lv_min_str = |0{ gv_minutes }|.
    ELSE.
      lv_min_str = |{ gv_minutes }|.
    ENDIF.

    gv_time = |{ lv_hour_str }:{ lv_min_str }|.

  ENDMETHOD.

  METHOD set_time.

    DATA: lv_hrs_from_mins TYPE i,
          lv_hours         TYPE i.
    lv_hrs_from_mins = iv_minutes DIV 60.
    lv_hours = iv_hours + lv_hrs_from_mins.

    gv_hours = lv_hours MOD 24.
    gv_minutes = iv_minutes MOD 60.


  ENDMETHOD.

  METHOD constructor.
* add solution here

    set_time( iv_hours = hours
              iv_minutes = minutes ).

  ENDMETHOD.


  METHOD get.
* add solution here

    format_answer(  ).
    result = gv_time.

  ENDMETHOD.

  METHOD add.
* add solution here
    gv_minutes += minutes.

    set_time( iv_hours = gv_hours
              iv_minutes = gv_minutes ).

  ENDMETHOD.

  METHOD sub.
* add solution here
    gv_minutes = gv_minutes - minutes.

    set_time( iv_hours = gv_hours
              iv_minutes = gv_minutes ).

  ENDMETHOD.

ENDCLASS.
