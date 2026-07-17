CLASS zcl_probar_reservas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_probar_reservas_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  TRY.
*  DATA(lo_reserva) = new zcl_gestor_reservas_aad( ).
*  out->write( lo_reserva->reservar_pista( i_hora = 9 i_nombre_pista = 'Pista 2' i_num_jugadores = 4 ) ).
*  catch zcx_reserva_no_valida_aad into data(lo_excepcion).
*  out->write( lo_excepcion->get_text( ) ).
*
*  endtry.

    TRY.

        DATA(lo_reserva) = NEW zcl_gestor_reservas_aad( ).
        out->write( lo_reserva->reservar_pista( i_hora = 7 i_nombre_pista = 'Pista 1' i_num_jugadores = 3 ) ).
      CATCH zcx_reserva_no_valida_aad INTO DATA(lx).
        out->write( lx->get_text( ) ).
        out->write( lx->motivo ).

    ENDTRY.



  ENDMETHOD.
ENDCLASS.
