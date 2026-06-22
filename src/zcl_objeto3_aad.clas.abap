CLASS zcl_objeto3_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_objeto3_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lv_proceso TYPE string.
    DATA(lo_contrato) = NEW zcl_objeto2_aad( ).
    "SOLO SE PUEDEN ACCEDER A ATRIBUTOS O MÉTODOS TRAVÉS DE PUBLIC SALVO QUE TENGA HERENCIA.

    IF lo_contrato IS BOUND.
      "DESDE UN OBJETO INSTANCIADO SE PUEDEN ACCEDER A ATRIBUTOS Y MÉTODOS INSTANCIADOS Y ESTÁTICOS.
      lo_contrato->set_cliente( EXPORTING iv_cliente = 'Experis' iv_localizacion = space
                                IMPORTING ev_status = DATA(lv_status)
                                CHANGING cv_proceso = lv_proceso ).

      lo_contrato->get_cliente(  IMPORTING ev_cliente = DATA(mv_cliente) ).
      lo_contrato->lv_region = 'EU'.
      lo_contrato->lv_moneda = 'EUR'.

    ENDIF.

    "A TRAVÉS DE OBJETOS ESTÁTICOS SOLO SE PUEDEN LLAMAR A MÉTODOS Y ATRIBUTOS ESTÁTICOS.
    zcl_obj_der=>lv_moneda = 'USD'.

    out->write( | { lo_contrato->lv_moneda } | ).

*        zcl_obj_der=>set_cntr_type( exporting iv_cntr_type = 'construccion' ).
*        zcl_obj_der=>get_cntr_type( importing ev_cntr_type = data(lv_cntr_type) ).

    lo_contrato->get_cliente_nombre(
        EXPORTING
            iv_cliente_id = '01'
        RECEIVING
             rv_cliente_nombre = DATA(lv_cliente_nombre)
            ).

    IF NOT lo_contrato->get_cliente_nombre( iv_cliente_id = '01' ) IS INITIAL.
      out->write( lv_cliente_nombre ).
    ENDIF.

    "  out->write( | { lv_cliente }-{ lv_status }-{ lv_proceso }-{ lo_contrato->lv_region } { lv_cntr_type }| ).
    " para el objeto -> para la clase =>
ENDMETHOD.

ENDCLASS.
