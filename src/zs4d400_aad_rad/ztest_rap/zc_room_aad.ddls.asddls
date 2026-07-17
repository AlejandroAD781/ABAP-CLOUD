@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZROOM_AAD'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ROOM_AAD
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ROOM_AAD
  association [1..1] to ZR_ROOM_AAD as _BaseEntity on $projection.ROOMUUID = _BaseEntity.ROOMUUID
{
  key Roomuuid,
  Roomid,
  Name,
  Capacity,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
