class BookingPdf
  include Prawn::View

  def initialize(booking)
    @booking = booking
    @geboortedatum = stringify_dates(@booking.geboortedatum)
    @geboortedatum_twee = stringify_dates(@booking.geboortedatum_twee) unless @booking.geboortedatum_twee.nil?
    @startdatum = stringify_dates(@booking.startdatum)
    @einddatum = stringify_dates(@booking.einddatum)
  end

  def generate_pdf
    partijen
    huur_en_verhuur
    huurperiode
    huurprijs_borg_aanbetaling
    verzekering
    contactpersonen
    nadere_afspraken
    ondertekening
    sleuteloverdracht
  end

  def stringify_dates(element)
    element = element.strftime("%d-%m-%Y")
  end

  def partijen
    text "<b>Huurcontract</b>",
      inline_format: true, align: :center
    move_down 25
    text "Huurcontract buscamper Carthago Malibu 640"
    move_down 5
    text "Lees voor het sluiten van de overeenkomst eerst de voorwaarden."
    move_down 30
    text "<b>1. Partijen</b>",
      inline_format: true
    move_down 10
    text "<b><u>Verhuurder van de kampeerauto</u></b>",
      inline_format: true
    move_down 15

    text "Naam: Familie Te Velde"
    move_down 5
    text "Straat + huisnummer: Esdoornstraat 7"
    move_down 5
    text "Postcode + woonplaats: 9501 GG Stadskanaal"
    move_down 5
    text "Telefoonnummer: 0599 622058  -  Mobiel: 06 51069513"
    move_down 5
    text "E-mail: info@veldstad.nl"
    move_down 20

    text "<b><u>Huurder van de kampeerauto</u></b>",
      inline_format: true
    move_down 15

    text "Naam: #{@booking.voornaam} #{@booking.achternaam}"
    move_down 5
    text "Adres: #{@booking.adres}"
    move_down 5
    text "Woonplaats: #{@booking.woonplaats}"
    move_down 5
    text "Telefoonnummer: #{@booking.telefoonnummer}"
    move_down 5
    unless @booking.mobiel.nil?
      text "Mobiel: #{@booking.mobiel}"
      move_down 5
    end
    text "Email: #{@booking.email}"
    move_down 5
    text "Identiteitsbewijs: #{@booking.identiteitsbewijs}"
    move_down 20
    text "Ondergetekenden: verhuurder van de kampeerauto, hierna genoemd 'verhuurder' en huurder van de kampeerauto hierna genoemd 'huurder', verklaren deze huurovereenkomst te zijn aangegaan volgens de volgende bepalingen en voorwaarden."
    move_down 30
  end

  def huur_en_verhuur
    text "<b>2. Huur en verhuur</b>",
      inline_format: true
    move_down 10

    text "Partijen sluiten hierbij een overeenkomst van huur en verhuur van een kampeerauto met daarbij behorende inventaris, aan partijen bekend en gespecificeerd op de aanwezige inventarislijst. Deze dient door beide partijen gecontroleerd en geparafeerd te worden."
    move_down 5
    text "Merk/type: Carthago Malibu 640"
    move_down 5
    text "Bouwjaar: 2018      Chassisnummer: 1234AB56789"
    move_down 5
    text "Kenteken: H-170-JN       Brandstof: diesel"
    move_down 5
    text "Kilometerstand bij aanvang huur: ______________________km"
    move_down 20
    text "- Bestuurder tijdens de periode: #{@booking.bestuurder}"
    move_down 5
    text "Geboortedatum: #{@geboortedatum}"
    move_down 5
    text "Rijbewijsnummer: #{@booking.rijbewijsnummer}"
    move_down 5
    if @booking.bestuurder_twee == "" || @booking.bestuurder_twee.nil?
      text "Extra bestuurder: geen"
      move_down 20
    else
      text "Extra bestuurder: #{@booking.bestuurder_twee}"
      move_down 5
      text "Geboortedatum: #{@geboortedatum_twee}"
      move_down 5
      text "Rijbewijsnummer: #{@booking.rijbewijsnummer_twee}"
      move_down 5
    end
    move_down 5
    text "Partijen moeten zich ervan overtuigen dat het rijbewijs van de huurder geschikt is voor het besturen van de kampeerauto en dat de huurder minimaal 23 jaar oud is."
    move_down 30
  end

  def huurperiode
    text "<b>3. Huurperiode</b>",
      inline_format: true
    move_down 10

    text "Huurperiode gaat in op: #{@startdatum} om 15:00 uur"
    move_down 5
    text "De huurperiode eindigt op: #{@einddatum} om 10:00 uur"
    move_down 5
    text "Afhaaladres: Fam. Te Velde"
    move_down 5
    text "Straat + huisnummer: Esdoornstraat 7"
    move_down 5
    text "Postcode + woonplaats: 9501 GG Stadskanaal"
    move_down 30
  end

  def huurprijs_borg_aanbetaling
    text "<b>4. Huurprijs, borg en aanbetaling</b>",
      inline_format: true
    move_down 10
    text "Huurprijs (€ 870,- p/w), totaal: €#{@booking.huurprijs},-"
    move_down 5
    text "In huurprijs inbegrepen: 1500 km per week. Wordt er meer gereden dan kost dit € 0,35 per km."
    move_down 5
    text "Vooruitbetaling: € 680,-"
    move_down 5
    text "Restantbedrag: €#{@booking.restant},-"
    move_down 5
    text "Restantbedrag te voldoen vóór: ___________________________"
    move_down 5
    text "Borg € 680,-"
    move_down 5
    text "Rekeningnummer/IBAN verhuurder: NL84 RABO 0314 7237 73"
    move_down 30
  end

  def verzekering
    text "<b>5. Verzekering</b>",
      inline_format: true
    move_down 10
    text "Verhuurder heeft naast de verplichte WA-verzekering een cascoverzekering/allrisk afgesloten incl. dekking voor brand, diefstal en bergingskosten, pechhulp en een vervangende camper gedurende de huurperiode."
    move_down 5
    text "Maatschappij: Aveco"
    move_down 5
    text "Polisnummer: __________________________________________"
    move_down 5
    text "Eigen risico verzekering: € 1000,-"
    move_down 30
  end

  def contactpersonen
    text "<b>6. Contactpersonen</b>",
      inline_format: true
    move_down 10
    text "1. Rob en Erna van der Horst - 06 49415996"
    move_down 5
    text "2. Henk Jan en Rietha te Velde - 06 51069513"
    move_down 30
  end

  def nadere_afspraken
    start_new_page
    text "<b>7. Nadere afspraken</b>",
      inline_format: true
    move_down 10
    text "----------------------------------------------------------------------------"
    move_down 5
    text "----------------------------------------------------------------------------"
    move_down 5
    text "----------------------------------------------------------------------------"
    move_down 5
    text "----------------------------------------------------------------------------"
    move_down 30
  end

  def ondertekening
    text "<b>8. Ondertekening</b>",
      inline_format: true
    move_down 10
    text "Aldus overeengekomen en door beide partijen ondertekend."
    move_down 5
    text "Datum: ____________________________________"
    move_down 5
    text "Plaats: ___________________________________"
    move_down 5
    text "Handtekening huurder: _____________________"
    move_down 5
    text "Handtekening verhuurder: __________________"
  end

  def sleuteloverdracht
    start_new_page
    text "<b>9. Sleuteloverdracht</b>",
      inline_format: true
    move_down 10
    image "app/assets/images/sleuteloverdracht.png", width: 550

    start_new_page
    image "app/assets/images/campercheck.png", width: 550
  end
end
