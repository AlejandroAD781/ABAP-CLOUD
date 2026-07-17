@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'logica2'
}
define view entity ZC_CDS_LOGICA2
  as select from ZCDS_LOGICA2
  association [1..1] to ZCDS_LOGICA2 as _BaseEntity on $projection.CONNECTION_ID = _BaseEntity.CONNECTION_ID and $projection.FLIGHT_DATE = _BaseEntity.FLIGHT_DATE and $projection.NAME = _BaseEntity.NAME
{
  @Endusertext: {
    Label: 'Flight Number', 
    Quickinfo: 'Flight Reference Scenario: Connection ID'
  }
  key connection_id,
  @Endusertext: {
    Label: 'Flight Date', 
    Quickinfo: 'Flight Reference Scenario: Flight Date'
  }
  key flight_date,
  @Endusertext: {
    Label: 'Airline Name', 
    Quickinfo: 'Flight Reference Scenario: Carrier Name'
  }
  key name,
  @Endusertext: {
    Label: 'Flight Price', 
    Quickinfo: 'Flight Reference Scenario: Flight Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  price,
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  doble,
  @Endusertext: {
    Label: 'Currency Code', 
    Quickinfo: 'Flight Reference Scenario: Currency Code'
  }
  Currency,
  categoria,
  _BaseEntity
}
