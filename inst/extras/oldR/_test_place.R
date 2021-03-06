context("Harmonize place names")


test_that("Places are harmonized correctly", {
  f <- "~/GitHub/bibliographica/tests/place_tests.csv"
  synonymes <- read.csv(file=f, header=True, sep="\t")
  for (i in i:nrow(synonymes)) {
    test_sentence <- synonymes$clause
    test_result <- synonymes$result
    if (is.na(synonymes$expected) || (synonymes$expected == "equal")) {
      expect_equal(polish_place(test_clause), test_result)
    }
  }
  expect_equal(polish_place("Printed by His Majesties command at Oxford"), "Oxford")
  expect_equal(polish_place("London printed"), "London")

  expect_equal(polish_place("Aff trycket vthgångit i Stockholm"), "Stockholm")
  expect_equal(polish_place("aff tryktet vthgångit i Stockholm"), "Stockholm")  

  expect_equal(polish_place("Ja toisen kerran Turusa prändätty"), "Turku")
  expect_equal(polish_place("toisen kerran Turusa"), "Turku")  
  expect_equal(polish_place("Sur l'imprimeà́ londres"), "London")
  expect_equal(polish_place("Te Philadelphia"), "Philadelphia Pa")
  expect_equal(polish_place("Imprinted in Aberdene"), "Aberdeen")

  expect_equal(polish_place("printe j stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckt vthi Stockholm"), "Stockholm")
  expect_equal(polish_place("Imprimè [sic] a London"), "London")    

  expect_equal(polish_place("Tryckt i Vpsala"), "Uppsala")
  expect_equal(polish_place("A Londres : [s.n.]"), "London")
  expect_equal(polish_place("A Londres"), "London")

  expect_equal(polish_place("[A Londres"), "London")
  expect_equal(polish_place("A Londres."), "London")
  expect_equal(polish_place("A Londres; et se trouvent à Paris"), "London")
  expect_equal(polish_place("a Londres"), "London")
  expect_equal(polish_place("En Londres"), "London")
  expect_equal(polish_place("A. Londres"), "London")
  expect_equal(polish_place("Reprinted at Dublin"), "Dublin")
  expect_equal(polish_place("And re-printed at Dublin"), "Dublin")
  expect_equal(polish_place("[Reprinted at Dublin"), "Dublin")
  expect_equal(polish_place(c("London", "Paris", "Paris", "Dublin", "Turku"))[[3]], "Paris")  

  expect_equal(polish_place("In the Savoy :;Edinburgh"), "Edinburgh")
  expect_equal(polish_place("In the Savoy"), "London")  

  # TODO
  #expect_equal(polish_place("[Edinburgh] Printed at London, and re-printed at Edinburgh"), "London")

  # New
  expect_equal(polish_place("Printed at London, and re-printed at Edinburgh"), "London")
  expect_equal(polish_place("Providence, in New-England"), "Providence RI")
  expect_equal(polish_place("Printed by his Majesties speciall command at Cambridge"), "Cambridge")
  expect_equal(polish_place("St. John's in Antigua"), "St Johns Antiqua")
  expect_equal(polish_place("St. Ives in Huntingdonshire [England]"), "St Ives")
  expect_equal(polish_place("Printed at Oxford, and reprinted at Shrewsbury"), "Oxford")
  expect_equal(polish_place("[London and Oxford]"), "London")
  expect_equal(polish_place("[Cambridge and London]"), "Cambridge")
  expect_equal(polish_place("Translated out of the High-Dutch, and printed at London"), "London")
  expect_equal(polish_place("Schenectady, (State of New-York)"), "Schenectady NY")
  expect_equal(polish_place("Printed first at London, and now re-printed at Edinburgh"), "London")
  expect_equal(polish_place("Printed by His Majesty command at Oxford"), "Oxford")
  expect_equal(polish_place("Printed by His Majesties command at Oxford [i.e. London], February 24. By Leonard Lichfield, printer to the university."), "London")
  expect_equal(polish_place("Printed by His Maiesties command at Oxford"), "Oxford")
  expect_equal(polish_place("Printed at London, to prevent mis-information"), "London")
  expect_equal(polish_place("Printed at London, and reprinted at Dublin"), "London")
  expect_equal(polish_place("Printed at London, and re-printed at Leith"), "London")
  expect_equal(polish_place("Prentyd at London"), "London")
  expect_equal(polish_place("Portland (District of Maine)"), "Portland Me")
  expect_equal(polish_place("Pointe-A-Pitre, [Guadeloupe]"), "Pointe-A-Pitre")
  expect_equal(polish_place("Paris :b chez Nicolas Buon, rue S. Jacques a l'Enseigne Sainct Claude, & de l'homme Sauvage"), "Paris")
  expect_equal(polish_place("Oxford [and London]"), "Oxford")
  expect_equal(polish_place("Newton, (State of New-Jersey)"), "Newton NJ")
  expect_equal(polish_place("Londres, et se trouve à Paris"), "London")
  expect_equal(polish_place("Londres [The Hague?]"), "London")
  expect_equal(polish_place("London and Francfort"), "London")
  expect_equal(polish_place("London [and Birmingham, England]"), "London")
  expect_equal(polish_place("London :printed by T. Moore in White-Fryers"), "London")
  expect_equal(polish_place("Londini excussum"), "London")
  expect_equal(polish_place("Keene: state of New-Hampshire"), "Keene NH")
  expect_equal(polish_place("In't Nederduyts over-gheset na't ghedruckte exemplaer van Londen"), "London")
  expect_equal(polish_place("Imprintit at Striviling"), "Stirling")
  expect_equal(polish_place("Imprinted in the Cathedrall Church of the blessed Trinitie Dublin"), "Dublin")
  expect_equal(polish_place("Imprinted first at London and reprinted at Edinburgh"), "London")
  expect_equal(polish_place("Imprinted at Yorke, and now reprinted at London"), "York")
  expect_equal(polish_place("Imprinted at Dublin, and now reprinted at London"), "Dublin")
  expect_equal(polish_place("Imprinnted [sic] at London"), "London")
  expect_equal(polish_place("Imprimé à Londres par Richard Field, sur les copies impriméez à Tours & à la Rochelle"), "London")
  expect_equal(polish_place("Hagh [The Hague]"), "The Hague")
  expect_equal(polish_place("Frederick-Town: (state of Maryland)"), "Fredericktown Md")
  expect_equal(polish_place("Edinburgh :bprinted by the heir of Andrew Anderson, printer to His most Sacred Majesty"), "Edinburgh")
  expect_equal(polish_place("Dublin [Ireland] : printed by Thomas Walsh, at Dick's Coffee-House in Skinner-Row, where printing work is done"), "Dublin")
  expect_equal(polish_place("Dublin [Ireland] : printed by T[homas]. Walsh, in Skinner-Row; where advertisements are taken in, and all manner of printing work perform'd, at reasonable rates"), "Dublin")
  expect_equal(polish_place("Calcutta [India] :bprinted by James White"), "Calcutta")
  expect_equal(polish_place("By order, re-printed at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("By order re-printed at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("Bath, County of Steuben, State of New-York"), "Bath NY")
  expect_equal(polish_place("Basseterre, in St. Christopher's [St.Kitts-Nevis]"), "Basseterre Saint Kitts")
  expect_equal(polish_place("Basseterre in St. Christopher"), "Basseterre Saint Kitts")
  expect_equal(polish_place("A Philadelphie, et se trouve à Paris"), "Philadelphia Pa")
  expect_equal(polish_place("A Londres, et se trouve a Paris"), "London")
  expect_equal(polish_place("A Amsterdam et a Leipzig"), "Amsterdam")
  expect_equal(polish_place("[Printed at London, and re-printed at Aberdene"), "London")
  expect_equal(polish_place("London] :bPrinted for Edward Husband, printer to the Honorable House of Commons"), "London")
  expect_equal(polish_place("London] : Printed for Tom Tell-troth at the sign of the Old Kings Head in Axe-yard in King street, Westminster"), "London")
  expect_equal(polish_place("Imprynted at London in Temstrete ouer agaynste the stiliardes, at the signe of the dobbel hood"), "London")
  expect_equal(polish_place("Imprynted at London in Powles church yarde by Rycharde Iugge and Iohn Cawood printers to the Quenes Maiestie. Cum priuilegio Regiæ Maiestatis]"), "London")
  expect_equal(polish_place("Imprintyd at London"), "London")
  expect_equal(polish_place("Imprintit at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("Imprinted at Roan by Martin Mesgissier, the kinges printer. 1585. With priuiledge. And imprinted at London"), "Rouen")
  expect_equal(polish_place("Impr]inted at Lon[don"), "London")
  expect_equal(polish_place("Hamburg and London]"), "Hamburg")
  expect_equal(polish_place("Glasgow] London printed, and re-printed at Glasgow"), "Glasgow")
  expect_equal(polish_place("Enpre[n]tyd in the Duchye of Braband in the towne of Andewarpe"), "Antwerp")
  expect_equal(polish_place("Emprynted at westmynstre"), "London")
  expect_equal(polish_place("Emprented in ye famous cite of Andwarpe"), "Antwerp")
  expect_equal(polish_place("Edinburgh] Re-printed at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("Edinburgh] Printed at Dublin, and re-printed at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("Edinburgh] London printed, Edinburgh re-printed"), "Edinburgh")
  expect_equal(polish_place("Edinburgh] London printed, and re-printed at Edinburgh"), "Edinburgh")
  expect_equal(polish_place("Dublin] London: printed and re-printed"), "Dublin")
  expect_equal(polish_place("Dubl]in"), "Dublin")
  expect_equal(polish_place("[Dubl]in"), "Dublin")  
  expect_equal(polish_place("At Edinburgh ye 17. day of July"), "Edinburgh")
  expect_equal(polish_place("A la Point-à-Pitre"), "Pointe-A-Pitre")

  expect_equal(polish_place("[London"), "London")
  expect_equal(polish_place("[London]"), "London")
  expect_equal(polish_place("Dublin"), "Dublin")
  expect_equal(polish_place("Edinburgh"), "Edinburgh")
  expect_equal(polish_place("[London?"), "London")
  expect_equal(polish_place("Imprinted at London"), "London")
  expect_equal(polish_place("Philadelphia"), "Philadelphia Pa")
  expect_equal(polish_place("Printed at London"), "London")
  expect_equal(polish_place("[Philadelphia"), "Philadelphia Pa")
  expect_equal(polish_place("London [England]"), "London")
  expect_equal(polish_place("Boston"), "Boston Ma")
  expect_equal(polish_place("[Impr]inted at Lon[don"), "London")
  expect_equal(polish_place("Imprinted at Lo[n]don"), "London")  
  expect_equal(polish_place("Imprynted at Ca[n]terbury"), "Canterbury")

  expect_equal(polish_place("Helsinki"), "Helsinki")
  expect_equal(polish_place("Ånyo tryckt i Stockholm"), "Stockholm")
  expect_equal(polish_place("A Londres"), "London")

  expect_equal(polish_place("[Tryckt i Stock]holm"), "Stockholm")
  expect_equal(polish_place("[Stóckholm]"), "Stockholm")
  
  expect_equal(polish_place("[Präntätty Stockhomin]"), "Stockholm")
  expect_equal(polish_place("[Präntätty Stockhomin [sic]]"), "Stockholm")
  expect_equal(polish_place("[Paynettu Stockhol[...]isa"), "Stockholm")

  expect_equal(polish_place("[London?]"), "London") 
  expect_equal(polish_place("[Londini Gothorum]"), "Lund")
  expect_equal(polish_place("[In Stockholm]"), "Stockholm")
  expect_equal(polish_place("[In der königlichen Heubtstadt Stockholm gedruckt]"), "Stockholm")
  expect_equal(polish_place("[A Stockholm]"), "Stockholm")
  expect_equal(polish_place("Stockholm"), "Stockholm")
  expect_equal(polish_place("[Stockholm]"), "Stockholm")
  expect_equal(polish_place("London"), "London")
  expect_equal(polish_place("Tryckt i Stockholm"), "Stockholm")
  expect_equal(polish_place("A Paris"), "Paris")    
  expect_equal(polish_place("Stokkholmisa"), "Stockholm")
  expect_equal(polish_place("I Stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckt j Stockholm"), "Stockholm")
  expect_equal(polish_place("Stockholm, Upsala och Åbo"), "Stockholm")
  expect_equal(polish_place("[Stockholm?]"), "Stockholm")

  expect_equal(polish_place("Stockholm och Åbo"), "Stockholm")
  expect_equal(polish_place("Londini Gothorum"), "Lund")
  expect_equal(polish_place("Gedruckt zu Stockholm"), "Stockholm")
  expect_equal(polish_place("A Stockholm"), "Stockholm")
  expect_equal(polish_place("[Tryckt j Stockholm]"), "Stockholm")
  expect_equal(polish_place("[Stockholm"), "Stockholm")  
  expect_equal(polish_place("Tryckt och vplagdt i Stockholm"), "Stockholm")
  expect_equal(polish_place("Stokkholmisa [sic]"), "Stockholm")
  expect_equal(polish_place("Stockholm och Upsala"), "Stockholm")
  expect_equal(polish_place("Stockholm :;Leipzig"), "Stockholm")
  expect_equal(polish_place("På nytt medh egen bekostnadt vplagd och tryckt i Stockholm"), "Stockholm")
  expect_equal(polish_place("Londres"), "London")
  expect_equal(polish_place("[Paris"), "Paris")
  expect_equal(polish_place("Tryckte j Stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckte i Stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckt vthi Stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckt j Stocholm"), "Stockholm")
  expect_equal(polish_place("Tryckt i then konungzlige hufwudstaden Stockholm"), "Stockholm")
  expect_equal(polish_place("Tryckt i Stockhom"), "Stockholm")
  expect_equal(polish_place("Tryckt i Stockholm på nytt"), "Stockholm")
  expect_equal(polish_place("Tryckt i Stockholm aff Georg Hantsch, Kongl: booktr."), "Stockholm")
  expect_equal(polish_place("Tryckt i Stockholm & Åbo"), "Stockholm")
  expect_equal(polish_place("Tryckt i Stocholm"), "Stockholm")
  expect_equal(polish_place("Stocklom"), "Stockholm")
  expect_equal(polish_place("Stockholm, Upsala und Åbo"), "Stockholm") 
  expect_equal(polish_place("Stockholm, Upsala & Åbo"), "Stockholm")
  expect_equal(polish_place("Stockholm :;København :;Kristiania"), "Stockholm")
  expect_equal(polish_place("Stockholm :;[Helsingfors]"), "Stockholm")
  expect_equal(polish_place("Stockholm ;;Helsingfors :;København"), "Stockholm")
  expect_equal(polish_place("Stocholm [sic]"), "Stockholm")
  expect_equal(polish_place("Stocholm [!]"), "Stockholm")
  expect_equal(polish_place("Sto[c]kholm"), "Stockholm")
  expect_equal(polish_place("Sto[c]holm"), "Stockholm")
  expect_equal(polish_place("Sotckholm [!]"), "Stockholm")
  expect_equal(polish_place("Prentat i Stockholm"), "Stockholm")
  expect_equal(polish_place("Made and sold by George Willdey at the corner house in Ludgate street next S:t. Pauls Church London"), "London")
  expect_equal(polish_place("Londini Scanorum"), "Lund")
  expect_equal(polish_place("Londini Scanor."), "Lund")
  expect_equal(polish_place("Londini Goth"), "Lund")
  expect_equal(polish_place("Londini"), "London")
  expect_equal(polish_place("Lond. Scanorum"), "Lund")
  expect_equal(polish_place("Imprimé á Stockholm"), "Stockholm")
  expect_equal(polish_place("Stockholm :;Helsingfors"), "Stockholm")
  expect_equal(polish_place("[Hamburg]"), "Hamburg")
  expect_equal(polish_place("[Göteborg]"), "Gothenburg")
  expect_equal(polish_place("Helsingfors :;Stockholm"), "Helsinki")
  expect_equal(polish_place("Förut tryckt i Stockholm, och å nyo uplagd i Åbo"), "Stockholm")
  expect_equal(polish_place("Copenhagen"), "Copenhagen")
  expect_equal(polish_place("Berlin-Charlottenburg"), "Berlin")
  expect_equal(polish_place("Åbo och Stockholm"), "Turku")
  expect_equal(polish_place("Gothenburg"), "Gothenburg")
  expect_equal(polish_place("Berlin' = Berlin"), "Berlin")
  expect_equal(polish_place("Berlin-Grunewald"), "Berlin")
  expect_equal(polish_place("Berlin und Stettin"), "Berlin")
  expect_equal(polish_place("Bergen :;Stockholm :;Kjøbenhavn"), "Bergen")
  expect_equal(polish_place("Armollisimman käskyn jälken präntätty Rigasa"), "Riga")
  expect_equal(polish_place("A Paris chez le sr. Desnos. Rue St. Jacques au globe, 1766."), "Paris")
  expect_equal(polish_place("A Liege"), "Liège")
  expect_equal(polish_place("à Berlin"), "Berlin")
  expect_equal(polish_place("[Rigasa]"), "Riga")
  expect_equal(polish_place("[Rigasa prändätty]"), "Riga")
  expect_equal(polish_place("Porvoo"), "Porvoo")
  expect_equal(polish_place("St. Petersburg"), "St Petersburg")
  expect_equal(polish_place("Brooklyn (N.Y.)"), "New York NY")
  expect_equal(polish_place("Pietari"), "St Petersburg")
  expect_equal(polish_place("New York"), "New York NY")
  expect_equal(polish_place("Port Arthur (Ont.)"), "Port Arthur On")
  expect_equal(polish_place("Wien"), "Vienna")
  expect_equal(polish_place("Brooklyn (N. Y.)"), "New York NY")
  expect_equal(polish_place("Riga"), "Riga")
  expect_equal(polish_place("Brooklyn, (N. Y.)"), "New York NY")
  expect_equal(polish_place("[Dorpat]"), "Tartu")
  expect_equal(polish_place("S:t Michel"), "Mikkeli")
  expect_equal(polish_place("Brooklyn, (N.Y.)"), "New York NY")
  expect_equal(polish_place("Tartu"), "Tartu")
  expect_equal(polish_place("Pest"), "Budapest")
  expect_equal(polish_place("Worcester (Mass.)"), "Worcester Ma")
  expect_equal(polish_place("Brooklyn, N.Y."), "New York NY")
  expect_equal(polish_place("[Dorpat?]"), "Tartu")
  expect_equal(polish_place("Wilno"), "Vilnius")
  expect_equal(polish_place("Fitchburg, Massachusetts"), "Fitchburg Ma")
  expect_equal(polish_place("[St. Petersburg]"), "St Petersburg")
  expect_equal(polish_place("S.-Peterburg' : A. È. Vineke"), "St Petersburg")
  expect_equal(polish_place("Jönköping"), "Jönnköping")
  expect_equal(polish_place("Duluth (MN)"), "Duluth Mn")
  expect_equal(polish_place("Tallinna"), "Tallinn")
  expect_equal(polish_place("Satakunta"), "Pori")
  expect_equal(polish_place("Hankoniemi"), "Hanko")
  expect_equal(polish_place("Gedruckt zu Riga"), "Riga")
  expect_equal(polish_place("Dorpat"), "Tartu")
  expect_equal(polish_place("Chicago (Ill.)"), "Chicago IL")
  expect_equal(polish_place("Brooklyn (NY)"), "New York NY")
  expect_equal(polish_place("Brahestad"), "Raahe")
  expect_equal(polish_place("[Tartto ]"), "Tartu")
  expect_equal(polish_place("St. Pietarborissa"), "St Petersburg")
  expect_equal(polish_place("Porvoo ;;Helsinki"), "Porvoo")
  expect_equal(polish_place("Port Arthur, Ontario"), "Port Arthur On")
  expect_equal(polish_place("Pargas"), "Parainen")
  expect_equal(polish_place("Nyslott"), "Savonlinna")
  expect_equal(polish_place("Napoli"), "Naples")
  expect_equal(polish_place("Fitchburg"), "Fitchburg Ma")
  expect_equal(polish_place("A St. Petersbourg"), "St Petersburg")
  expect_equal(polish_place("Zu Riga"), "Riga")
  expect_equal(polish_place("Worcester (MA)"), "Worcester Ma")
  expect_equal(polish_place("Wien ;;Leipzig"), "Vienna")
  expect_equal(polish_place("Verteutscht und gedruckt zu Riga"), "Riga")
  expect_equal(polish_place("Varsovie"), "Warsaw")
  expect_equal(polish_place("Uusikirkko"), "Uusikirkko")
  expect_equal(polish_place("Tryckt i Riga"), "Riga")
  expect_equal(polish_place("Trondhjem"), "Trondheim")
  expect_equal(polish_place("Tikkurila"), "Vantaa")
  expect_equal(polish_place("St.-Petersburg"), "St Petersburg")
  expect_equal(polish_place("St. Petersbourg"), "St Petersburg")
  expect_equal(polish_place("St. -Petersburg"), "St Petersburg")
  expect_equal(polish_place("St-Petersburg"), "St Petersburg")
  expect_equal(polish_place("Sarvlaks"), "Sarvilahti")
  expect_equal(polish_place("Rooma"), "Rome")
  expect_equal(polish_place("Riga :;Helsingfors"), "Riga")
  expect_equal(polish_place("Porvoo :;Borgo"), "Porvoo")
  expect_equal(polish_place("Porvoo ;;Viipuri"), "Porvoo")
  expect_equal(polish_place("Port Arthur, Ont."), "Port Arthur On")
  expect_equal(polish_place("Port Arthur (Ontario)"), "Port Arthur On")
  expect_equal(polish_place("Port Arthur"), "Port Arthur On")
  expect_equal(polish_place("Pirkkala"), "Tampere")
  expect_equal(polish_place("Petrozavodsk''"), "St Petersburg")
  expect_equal(polish_place("Petrozavodsk'"), "St Petersburg")
  expect_equal(polish_place("Perno"), "Turku")
  expect_equal(polish_place("Östersund"), "Oslo")
  expect_equal(polish_place("Occidentalis Arhusae"), "Aarhus")
  expect_equal(polish_place("New York (NY)"), "New York NY")
  expect_equal(polish_place("Minneapolis (MN)"), "Minneapolis Mn")
  expect_equal(polish_place("Minneapolis (Minn.)"), "Minneapolis Mn")
  expect_equal(polish_place("Luulaja"), "Lulea")
  expect_equal(polish_place("Lubecae"), "Lybeck")
  expect_equal(polish_place("Linköpingisä"), "Linköping")
  expect_equal(polish_place("Leipsic"), "Leipzig")
  expect_equal(polish_place("Kalevassa (Mich.)"), "Kaleva Mi")
  expect_equal(polish_place("Jönkiöping"), "Jönnköping")
  expect_equal(polish_place("Jääski"), "Jääski")
  expect_equal(polish_place("Ishpeming (MI)"), "Ishpeming Mi")
  expect_equal(polish_place("Inkerinmaalla"), "Inkeri")
  expect_equal(polish_place("Haukilahti"), "Espoo")
  expect_equal(polish_place("Hancockissa, Mich."), "Hancock Mi")
  expect_equal(polish_place("Hancockissa (Mich.)"), "Hancock Mi")
  expect_equal(polish_place("Gedrukkt Azu bo [sic]"), "Turku")
  expect_equal(polish_place("Gamburg' ;;Bazel' r ;;London' ;;Gel'singfors'"), "Hamburg")
  expect_equal(polish_place("Franc fort & Leipzig"), "Frankfurt")
  expect_equal(polish_place("Fichtburg, Mass."), "Fitchburg Ma")
  expect_equal(polish_place("Fichtburg (Mass.)"), "Fitchburg Ma")
  expect_equal(polish_place("Enthlímmenon en Abóe"), "Turku")
  expect_equal(polish_place("Dorpati Livonvm"), "Tartu")
  expect_equal(polish_place("Christianstad"), "Copenhagen")
  expect_equal(polish_place("Chicago (IL)"), "Chicago IL")
  expect_equal(polish_place("Calumet (MI)"), "Calumet Mi")
  expect_equal(polish_place("Calumet"), "Calumet Mi")
  expect_equal(polish_place("Brvnsvigae"), "Braniewo")
  expect_equal(polish_place("Brooklyn, New York"), "New York NY")
  expect_equal(polish_place("Brooklyn, N. Y."), "New York NY")
  expect_equal(polish_place("Brooklyn [N.Y.]"), "New York NY")
  expect_equal(polish_place("Brooklyn (N.Y)"), "New York NY")
  expect_equal(polish_place("Brahestads"), "Raahe")
  expect_equal(polish_place("Borgosa"), "Porvoo")
  expect_equal(polish_place("Armollisimman käskyn jälken präntätty Rigasa"), "Riga")
  expect_equal(polish_place("Ala-Tornio"), "Tornio")
  expect_equal(polish_place("Aarhus"), "Aarhus")
  expect_equal(polish_place("[Warschau?]"), "Warsaw")
  expect_equal(polish_place("[St. Petersburg]"), "St Petersburg")
  expect_equal(polish_place("[St. Petersbourg]"), "St Petersburg")
  expect_equal(polish_place("[Sankt-Peterburg]"), "St Petersburg")
  expect_equal(polish_place("[Sankt Peterburg]"), "St Petersburg")
  expect_equal(polish_place("[Rigasa]"), "Riga")
  expect_equal(polish_place("[Rigasa prändätty]"), "Riga")
  expect_equal(polish_place("[Port Arthur (Ont.)]"), "Port Arthur On")
  expect_equal(polish_place("[Petrozavodsk']"), "St Petersburg")
  expect_equal(polish_place("[Lubecae]"), "Lybeck")
  expect_equal(polish_place("[Korsholm]"), "Mustasaari")
  expect_equal(polish_place("[Cologne]"), "Cologne")

  expect_equal(polish_place("londres par sur les copies imprimeez à tours à la rochelle"), "London")

})





