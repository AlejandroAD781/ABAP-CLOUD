CLASS zcl_objeto2_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA lv_moneda TYPE c LENGTH 3. "ATRIBUTO ESTÁTICO
    DATA lv_region TYPE string.

    METHODS set_cliente
        IMPORTING iv_cliente TYPE string        "Parametro de entrada
                  iv_localizacion TYPE string
        EXPORTING ev_status TYPE string         "Parametro de salida
        CHANGING cv_proceso TYPE string.     "Parametro de entrada y salida o de cambio.

    METHODS get_cliente
        EXPORTING ev_cliente TYPE string.

    CLASS-METHODS: set_cntr_type IMPORTING iv_cntr_type TYPE string,
                   get_cntr_type EXPORTING ev_cntr_type TYPE string.

 METHODS get_cliente_nombre
        importing iv_cliente_id type string
        RETURNING VALUE(rv_cliente_nombre) type string.

  PROTECTED SECTION.
    DATA lv_fecha TYPE sydate.

  PRIVATE SECTION.

    DATA lv_cliente TYPE string.
    CLASS-DATA cntr_type type string.
ENDCLASS.



CLASS zcl_objeto2_aad IMPLEMENTATION.

  METHOD set_cliente.
    lv_cliente = iv_cliente.
    ev_status = 'ok'.
    cv_proceso = 'Started'.


  ENDMETHOD.

  METHOD get_cliente.
  ev_cliente = lv_cliente.
  ENDMETHOD.

 METHOD get_cntr_type. " es importante que está a la izquierda y derecha según importing/exporting.
    ev_cntr_type = cntr_type.
  ENDMETHOD.

  METHOD set_cntr_type.
    cntr_type = iv_cntr_type.
  ENDMETHOD.

  METHOD get_cliente_nombre.
    case iv_cliente_id.
        when '01'.
            rv_cliente_nombre = 'Cliente n 01'.
        when '02'.
            rv_cliente_nombre = 'Cliente n 02'.
        endcase.

  ENDMETHOD.

ENDCLASS.
