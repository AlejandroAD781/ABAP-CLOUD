@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Reserva'
@Metadata.allowExtensions: true
@UI.headerInfo.typeName: 'Reserva'
@UI.headerInfo.typeNamePlural: 'Reservas'

define view entity ZC_Reserva
  as projection on zi_reserva as Reservation
{
  key reservationuuid   as ReservationUuid,
      roomuuid           as RoomUuid,
      reservationdate    as ReservationDate,
      starttime          as StartTime,
      endtime            as EndTime,
      durationminutes    as DurationMinutes,
      status             as Status,

      /* Acción expuesta en la proyección */
      _Room : redirected to parent ZC_Room
}
