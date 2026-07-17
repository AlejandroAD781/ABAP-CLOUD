CLASS zcl_guia_turistica_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_guia_turistica_aad IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_tabla TYPE TABLE OF REF TO zif_negocio_sanlucar.
    DATA lo_negocio TYPE REF TO zif_negocio_sanlucar.

    lo_negocio = NEW zcl_bodega_sanlucar_aad( i_descripcion = 'descripcionBodega' i_nombre = 'nombreBodega' ).
    APPEND lo_negocio TO lt_tabla.

    lo_negocio = NEW zcl_marisqueria_sanlucar_aad( i_descripcion = 'descripcionMarisqueria' i_nombre = 'nombreMariqueria' ).
    APPEND lo_negocio TO lt_tabla.

    lo_negocio = NEW zcl_hipodromo_sanlucar( i_descripcion = 'descripcionHipdromo' i_nombre = 'nombreHipodromo' ).
    APPEND lo_negocio TO lt_tabla.


    LOOP AT LT_TABLA into lo_negocio.
      out->write( | { lo_negocio->get_tipo(  ) } - { lo_negocio->get_nombre(  ) } - Precio: { lo_negocio->calcular_precio(  ) }| ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
