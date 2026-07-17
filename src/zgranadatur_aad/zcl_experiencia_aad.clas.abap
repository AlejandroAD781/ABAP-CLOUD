CLASS zcl_experiencia_aad DEFINITION
  PUBLIC
  CREATE PUBLIC.
  PUBLIC SECTION.
    DATA: nombre   TYPE string,
          duracion TYPE i,
          num_part TYPE i.

    METHODS: calcular_precio RETURNING VALUE(rv_total) TYPE zdecimal2_25,
      constructor IMPORTING
                    i_nombre   TYPE string
                    i_precio   TYPE zdecimal2_25
                    i_duracion TYPE i
                    i_num_part TYPE i,
      get_precio_Base exporting o_precio type zdecimal2_25.
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: precio TYPE p DECIMALS 2.

ENDCLASS.

CLASS zcl_experiencia_aad IMPLEMENTATION.
  METHOD calcular_precio.
    IF num_part > 8.
      rv_total = precio * num_part * '0.9'.
    ELSE.
      rv_total = precio * num_part.
    ENDIF.
  ENDMETHOD.

  METHOD constructor.
    nombre = i_nombre.
    precio = i_precio.
    duracion = i_duracion.
    num_part = i_num_part.
  ENDMETHOD.

    METHOD get_precio_base.
    o_precio = precio.
  ENDMETHOD.

ENDCLASS.
