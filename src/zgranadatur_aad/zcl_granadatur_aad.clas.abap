CLASS zcl_granadatur_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_granadatur_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_experiencia) = NEW zcl_experiencia_25( i_nombre = 'Visita a Isla Mayor'
    i_duracion = 60
    i_precio = '10.50'
    i_num_part = 20 ).

*    DATA(lv_total) = lo_experiencia->calcular_precio(  ).
*    out->write( | El precio es { lv_total } | ).

    DATA lv_precio_base TYPE zdecimal2_25.
    lo_experiencia->get_precio_base( IMPORTING o_precio = lv_precio_base ).
    out->write( | El precio base { lv_precio_base } | ).

    out->write( | -------------- | ).
    out->write( | -------------- | ).

    DATA(lo_monumento) = NEW zcl_visita_monumento_aad( i_nombre = 'Visita La Alhambra'
    i_duracion = 90
    i_precio = '15.75'
    i_num_part = 50
    i_monumento = 'La Alhambra'
    i_reserva = abap_true ).

    DATA(lv_total) = lo_monumento->calcular_precio(  ).
    out->write( | El precio es { lv_total } | ).

    IF lo_monumento->reserva = abap_true.
      out->write(  | El monumento { lo_monumento->monumento } tiene reserva obligatoria| ).
    ENDIF.

    out->write( | -------------- | ).
    out->write( | -------------- | ).

    DATA(lo_ruta_gastro) = NEW zcl_ruta_gastronomica_aad( i_nombre = 'tapeillo'
    i_duracion = 45
    i_precio = '25'
    i_num_part = 2
    i_num_tapas = 5
    i_nocturno = abap_true ).

    lv_total = lo_ruta_gastro->calcular_precio( ).
    out->write( | El precio es { lv_total } | ).
    IF lo_ruta_gastro->nocturno = abap_true.
      out->write( | La ruta { lo_ruta_gastro->nombre } es una cena | ).
    ELSE.
      out->write( | La ruta { lo_ruta_gastro->nombre } es un almuerzo| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
