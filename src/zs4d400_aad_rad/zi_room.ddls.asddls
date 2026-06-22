@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS room'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Room as select from zroom_aad
composition [0..*] of zi_reserva as _Reservations
composition [0..*] of ZI_equipo as _Equipos // composition si los equipos son fijos (pantallas, proyector...), si no asociation
{
key roomuuid,
roomid,
name,
capacity,
_Reservations,
_Equipos
}
