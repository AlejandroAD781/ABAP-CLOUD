CLASS lhc_ZI_Room DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_Room RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_Room RESULT result.

ENDCLASS.

CLASS lhc_ZI_Room IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zi_reserva DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_reserva RESULT result.

    METHODS CancelReservation FOR MODIFY
      IMPORTING keys FOR ACTION zi_reserva~CancelReservation.

    METHODS CalculateDuration FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_reserva~CalculateDuration.

    METHODS CheckOverlappingReservations FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_reserva~CheckOverlappingReservations.

ENDCLASS.

CLASS lhc_zi_reserva IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD CancelReservation.

   " Leer registros sobre los que se ejecuta la acción
  READ ENTITIES OF zi_room IN LOCAL MODE
    ENTITY zi_reserva
      FIELDS ( status )
      WITH CORRESPONDING #( keys )
    RESULT DATA(reservations).

  " Actualizar status a 'C' (Cancelada)
  MODIFY ENTITIES OF zi_room IN LOCAL MODE
    ENTITY zi_reserva
      UPDATE FIELDS ( status )
      WITH VALUE #( FOR res IN reservations
                    ( %tky   = res-%tky
                      status = 'C' ) ).

  ENDMETHOD.

  METHOD CalculateDuration.

    " 1. Leer los datos actuales de las reservas modificadas
    READ ENTITIES OF zi_room IN LOCAL MODE
    ENTITY zi_reserva
      FIELDS ( starttime endtime )
      WITH CORRESPONDING #( keys )
    RESULT DATA(reservations).

  " 2. Calcular duración y actualizar
  MODIFY ENTITIES OF zi_room IN LOCAL MODE
    ENTITY zi_reserva
      UPDATE FIELDS ( durationminutes )
      WITH VALUE #( FOR res IN reservations
                    ( %tky          = res-%tky
                      durationminutes = ( res-endtime - res-starttime ) / 60 ) ).

  ENDMETHOD.

  METHOD CheckOverlappingReservations.

   " 1. Leer los datos de las reservas a validar
  READ ENTITIES OF zi_room IN LOCAL MODE
    ENTITY zi_reserva
      FIELDS ( roomuuid reservationdate starttime endtime )
      WITH CORRESPONDING #( keys )
    RESULT DATA(reservations).

  " 2. Para cada reserva, buscar solapamientos en la tabla persistente
  LOOP AT reservations INTO DATA(res).

    SELECT SINGLE FROM zreserva_aad
      FIELDS reservationuuid
      WHERE roomuuid        =  @res-roomuuid
        AND reservationdate =  @res-reservationdate
        AND starttime       <  @res-endtime
        AND endtime         >  @res-starttime
        AND reservationuuid <> @res-reservationuuid  " excluir ella misma
        AND status          <> 'C'                   " ignorar canceladas
      INTO @DATA(overlapping).

    " 3. Si hay solapamiento, reportar error RAP
    IF sy-subrc = 0.
      APPEND VALUE #( %tky = res-%tky ) TO failed-zi_reserva.

      APPEND VALUE #( %tky        = res-%tky
                      %msg        = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-error
                                      text     = 'La sala ya tiene una reserva en ese horario' )
                      %element-starttime = if_abap_behv=>mk-on
                      %element-endtime   = if_abap_behv=>mk-on )
             TO reported-zi_reserva.
    ENDIF.

  ENDLOOP.

  ENDMETHOD.

ENDCLASS.
