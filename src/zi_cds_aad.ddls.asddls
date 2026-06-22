@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asociacion con parametros'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_aad
  with parameters
    pCity : /dmo/city,
    pCountryCode : land1
  as select from /dmo/agency

{
  key agency_id     as AgencyId,
      name          as Name,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,
      web_address   as WebAddress,
      attachment    as Attachement,
      mime_type     as MimeType,
      filename      as Filename

}
where
  city = $parameters.pCity and country_code = $parameters.pCountryCode;
  
