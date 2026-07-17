CLASS zcl_gestor_reservas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*    DATA:
*      hora          TYPE i,
*      num_jugadores TYPE i,
*      nombre_pista  TYPE string,
*      motivo TYPE string.

    METHODS:
      reservar_pista IMPORTING i_hora           TYPE i
                               i_num_jugadores  TYPE i
                               i_nombre_pista   TYPE string
                     RETURNING VALUE(resultado) TYPE string
                     RAISING   zcx_reserva_no_valida_aad.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_gestor_reservas_aad IMPLEMENTATION.
  METHOD reservar_pista.

*    hora = i_hora.
*    num_jugadores = i_num_jugadores.
*    nombre_pista = i_nombre_pista.
*
*    IF i_hora < 8 OR i_hora > 23.
*      resultado = 'Reservas permitidas entre las 8-23 horas'.
*    ENDIF.
*
*    IF i_num_jugadores <> 4.
*      resultado = 'Solo disponible para 4 jugadores'.
*    ENDIF.
*
*    IF i_nombre_pista <> 'Pista 1'.
*      resultado = 'La pista debe ser "Pista 1"'.
*    ENDIF.
*
*    IF i_nombre_pista <> 'Pista 1' or  i_num_jugadores <> 4 or i_hora < 8 OR i_hora > 23.
*    raise exception new zcx_resultado_novalido_aad(  ).
*    ENDIF.
*
*    IF i_nombre_pista = 'Pista 1' AND i_num_jugadores = 4 AND i_hora between 8 and 23.
*    resultado = | Reserva realizada a las { hora } en la pista { nombre_pista } para { i_num_jugadores } jugadores|.
*    ENDIF.
*

    "Solucion individual"
*    IF i_hora < 8 OR i_hora > 23.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_aad
*        EXPORTING
**         motivo = 'HORA entre 8-23'
*          hora = i_hora.
*    ENDIF.
*
*    IF i_num_jugadores <> 4.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_aad
*        EXPORTING
**         motivo        = 'solo 4 JUGADORES'
*          num_jugadores = i_num_jugadores.
*    ENDIF.
*
*    IF i_nombre_pista = 'Pista 1'.
*      RAISE EXCEPTION TYPE zcx_reserva_no_valida_aad
*        EXPORTING
**         motivo       = 'no puedes PISTA 1'
*          nombre_pista = i_nombre_pista.
*    ENDIF.

    "Solucion conjunta"
    IF i_hora < 8 OR i_hora > 23 OR i_num_jugadores <> 4 OR i_nombre_pista = 'Pista 1'.
      RAISE EXCEPTION TYPE zcx_reserva_no_valida_aad
        EXPORTING
*         motivo        = 'HORA entre 8-23'
          hora          = i_hora
          num_jugadores = i_num_jugadores
          nombre_pista  = i_nombre_pista.

    ENDIF.
    resultado = 'Reserva realizada correctamente'.


  ENDMETHOD.


ENDCLASS.
