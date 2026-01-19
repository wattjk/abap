CLASS zcl_rle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

    METHODS decode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_rle IMPLEMENTATION.

  METHOD encode.

    "Add solution here
    DATA(lv_len) = strlen( input ).

    DATA: index        TYPE i,
          lv_prev_char TYPE string,
          lv_char      TYPE string,
          lv_counter   TYPE i.
    CLEAR: index, lv_counter.
    CHECK lv_len > 0.
    lv_prev_char = input+0(1).

    DO lv_len TIMES.
      lv_char = input+index(1).
      IF lv_char = lv_prev_char.
        lv_counter += 1.
      ELSE.
        IF lv_counter > 1.
          result = result && lv_counter && lv_prev_char.
        ELSE.
          result = result && lv_prev_char.
        ENDIF.
        lv_counter = 1.
      ENDIF.

      lv_prev_char = lv_char.
      index += 1.
    ENDDO.
    "handle the last change of character:
    IF lv_counter > 1.
      result = result && lv_counter && lv_prev_char.
    ELSE.
      result = result && lv_prev_char.
    ENDIF.

  ENDMETHOD.


  METHOD decode.

    "Add solution here
    DATA: lv_digits TYPE string VALUE '0123456789',
          index     TYPE i,
          lv_pos    TYPE i,
          lv_num    TYPE i,
          lv_num_str type string,
          lv_repeat type i.

    DATA(lv_len) = strlen( input ).

    DO lv_len TIMES.

      lv_pos = 1.
      clear lv_repeat.
      DATA(lv_char) = input+index(lv_pos).

      IF lv_char CO lv_digits.
      "if lv_char is a number check the next number
        lv_num_str = lv_num_str && lv_char.

      ELSE.
      "if lv_char is not a number add to output
         lv_repeat = lv_num_str.
         DO lv_repeat TIMES.
            result = result && lv_char.
         ENDDO.
         IF lv_repeat IS INITIAL.
            result = result && lv_char.
         ENDIF.

        clear: lv_num_str, lv_repeat.
       ENDIF.

      index += 1.
    ENDDO.

  ENDMETHOD.

ENDCLASS.
