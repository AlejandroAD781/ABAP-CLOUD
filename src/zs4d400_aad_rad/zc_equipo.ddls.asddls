@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Equipo'
define view entity ZC_Equipo
  as projection on ZI_equipo as Equipo
{
  key equipmentuuid as EquipmentUuid,
      roomuuid       as RoomUuid,
      equipmentname  as EquipmentName,

      _Room : redirected to parent ZC_Room
}
