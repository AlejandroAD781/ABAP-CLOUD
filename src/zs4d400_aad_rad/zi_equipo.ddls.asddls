@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS EQUIPO'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_equipo as select from zequipo_aad
association to parent ZI_Room as _Room on $projection.roomuuid = _Room.roomuuid
{
    key equipmentuuid,
    roomuuid,
    equipmentname,
    
    _Room
}
