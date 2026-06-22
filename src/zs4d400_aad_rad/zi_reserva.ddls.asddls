@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS reserva'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_reserva as select from zreserva_aad
association to parent ZI_Room as _Room on $projection.roomuuid = _Room.roomuuid
{
key reservationuuid,
roomuuid,
reservationdate,
starttime,
endtime,
durationminutes,
status,

_Room
}
