@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Sala'
@Metadata.allowExtensions: true
@UI.headerInfo.typeName: 'Sala'
@UI.headerInfo.typeNamePlural: 'Salas'

define root view entity ZC_Room
  provider contract transactional_query
  as projection on ZI_Room as Room
{
  key roomuuid    as RoomUuid,

      @UI: { lineItem: [{ position: 10, importance: #HIGH }],
             identification: [{ position: 10 }] }
      roomid      as RoomId,

      @UI: { lineItem: [{ position: 20, importance: #HIGH }],
             identification: [{ position: 20 }] }
      name        as Name,

      @UI: { lineItem: [{ position: 30, importance: #MEDIUM }],
             identification: [{ position: 30 }] }
      capacity    as Capacity,

      /* Asociaciones a las proyecciones hijas */
      _Reservations : redirected to composition child ZC_Reserva,
      _Equipos      : redirected to composition child ZC_Equipo
}
