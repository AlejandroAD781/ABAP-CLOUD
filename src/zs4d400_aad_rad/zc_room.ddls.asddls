@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Sala'
@Metadata.allowExtensions: true
@UI.headerInfo: {
  typeName: 'Sala',
  typeNamePlural: 'Salas',
  title: { type: #STANDARD, value: 'Name' },
  description: { value: 'RoomId' }
}

define root view entity ZC_Room
  provider contract transactional_query
  as projection on ZI_Room as Room
    association [1..1] to ZI_Room as _BaseEntity on $projection.RoomUuid = _BaseEntity.roomuuid
  
{
      @UI.facet: [
        {
          id: 'General',
          purpose: #STANDARD,
          type: #IDENTIFICATION_REFERENCE,
          label: 'Sala',
          position: 10
        }
      ]
  key roomuuid as RoomUuid,

      @UI: {
        lineItem: [{ position: 10, importance: #HIGH }],
        identification: [{ position: 10 }]
      }
      roomid as RoomId,

      @UI: {
        lineItem: [{ position: 20, importance: #HIGH }],
        identification: [{ position: 20 }]
      }
      name as Name,

      @UI: {
        lineItem: [{ position: 30, importance: #MEDIUM }],
        identification: [{ position: 30 }]
      }
      capacity as Capacity,

      _Reservations : redirected to composition child ZC_Reserva,
      _Equipos      : redirected to composition child ZC_Equipo,
      _BaseEntity
}
