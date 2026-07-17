CLASS zcl_mundial_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_mundial_aad IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA(lo_periodista) = NEW zcl_periodista_aad( i_acreditaciones = 1
*    i_caducidad = '14072026'
*    i_nombre = 'Paco'
*    i_pais = 'España' i_prensa = 'television' i_acceso = abap_true  ).
*
*    DATA(lo_jugador) = NEW zcl_jugador_aad( i_acreditaciones = 2
*    i_caducidad = '20072026'
*    i_nombre = 'Ivan Campo'
*    i_pais = 'España' i_dorsal = 10 i_posicion = 'Defensa' i_convocado = abap_false ).
*
*
*    IF lo_periodista->acceso = abap_true.
*      out->write( '----Periodista con acceso a zonas comunes-----' ).
*      out->write( lo_periodista->describir_pase(  ) ).
*    ELSE.
*      out->write( '----Periodista sin acceso a zonas comunes-----' ).
*      out->write( lo_periodista->describir_pase(  ) ).
*    ENDIF.
*
*    IF lo_jugador->convocado = abap_true.
*      out->write( '----Jugador con acceso al campo-----' ).
*      out->write( lo_jugador->describir_pase(  ) ).
*    ELSE.
*      out->write( '----Jugador sin acceso al campo-----' ).
*      out->write( lo_jugador->describir_pase(  ) ).
*    ENDIF.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""CON POLIMORFISMO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " Creo la tabla con referencia al padre
    DATA: lt_acreditados TYPE TABLE OF REF TO zcl_acreditado_aad.

    " Metemos objetos de distintos tipos en la misma tabla
    APPEND NEW zcl_jugador_AAD( i_nombre = 'Lamine '
                                          i_pais = 'España'
                                          i_acreditaciones = 10
                                          i_caducidad = '20213021'
                                          i_dorsal = 12
                                          i_posicion = 'extremo'
                                          i_convocado = abap_true
                                          ) TO lt_acreditados.

    APPEND NEW zcl_periodista_aad( i_nombre = 'Juanma '
                                          i_pais = 'España'
                                          i_acreditaciones = 8
                                          i_caducidad = '20213021'
                                          i_prensa = 'ABC'
                                          i_acceso = abap_true
                                          ) TO lt_acreditados.

    APPEND NEW zcl_jugador_aad( i_nombre = 'Pedri'
                                          i_pais = 'España'
                                          i_acreditaciones = 10
                                          i_caducidad = '20213021'
                                          i_dorsal = 12
                                          i_posicion = 'extremo'
                                          i_convocado = abap_true
                                          ) TO lt_acreditados.

    " Y ahora... el momento mágico. TENER EN CUETNA QUE ESTO NO PUEDE LLAMAR A MÉTODOS DE LOS HIJOS.
    LOOP AT lt_acreditados INTO DATA(lo_acreditado).
      out->write( lo_acreditado->describir_pase( ) ).
    ENDLOOP.




  ENDMETHOD.
ENDCLASS.
