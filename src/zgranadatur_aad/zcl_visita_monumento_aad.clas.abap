CLASS zcl_visita_monumento_aad DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_aad
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data: monumento TYPE string,
        reserva TYPE abap_bool.

  methods: constructor IMPORTING
                    i_nombre   TYPE string
                    i_precio   TYPE zdecimal2_25
                    i_duracion TYPE i
                    i_num_part TYPE i
                    i_monumento TYPE string
                    i_reserva TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_visita_monumento_aad IMPLEMENTATION.
  METHOD constructor.
  "llamando al constructor del padre" "parametro padre = parametro hijo".
    super->constructor( i_nombre = i_nombre i_precio = i_precio i_duracion = i_duracion i_num_part = i_num_part ).
    monumento = i_monumento. "atributo = parametro hijo porque no está en padre.
    reserva = i_reserva.
  ENDMETHOD.

ENDCLASS.
