@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZROOM_AAD'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ROOM_AAD
  as select from ZROOM_AAD
{
  key roomuuid as Roomuuid,
  roomid as Roomid,
  name as Name,
  capacity as Capacity,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
