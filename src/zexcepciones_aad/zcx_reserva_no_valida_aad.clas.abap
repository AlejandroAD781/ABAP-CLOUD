CLASS zcx_reserva_no_valida_aad DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA motivo TYPE string.
    DATA hora TYPE i.
    DATA num_jugadores TYPE i.
    DATA nombre_pista TYPE string.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
        !textid       LIKE if_t100_message=>t100key OPTIONAL
        !previous     LIKE previous OPTIONAL
        hora          TYPE i OPTIONAL
        num_jugadores TYPE i OPTIONAL
        nombre_pista  TYPE string OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_reserva_no_valida_aad IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).

    "Solucion separada.
*    if hora is supplied.
*    me->motivo = | A las { hora } no se puede reservar. Horario es de 8 a 23. |.
*    endif.
*
*        if num_jugadores is supplied.
*    me->motivo = | Se necesitan 4 jugadores y no { num_jugadores } |.
*    endif.
*
*        if nombre_pista is supplied.
*    me->motivo = | La pista { nombre_pista } esta ocupada |.
*    endif.

    "solucion conjunta
    IF hora < 8 OR hora > 23.
      me->motivo = | A las { hora } no se puede reservar. El horario es de 8 a 23. |.
    ENDIF.

    IF num_jugadores <> 4.
      me->motivo = | { me->motivo } Se necesitan 4 jugadores y no { num_jugadores }. |.
    ENDIF.

    IF nombre_pista = 'PISTA_1'.
      me->motivo = | { me->motivo } La pista { nombre_pista } está ocupada |.
    ENDIF.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
