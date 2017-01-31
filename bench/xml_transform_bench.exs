defmodule XmlTransformBench do
  use Benchfella
  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")


  @xml """
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <ns2:Envelope xmlns:ns2="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns3="http://www.iata.org/IATA/EDIST">
    <ns2:Body>
        <ns3:AirShoppingRS Version="">
            <ns3:Document>
                <ns3:Name>1.0</ns3:Name>
            </ns3:Document>
            <ns3:Success/>
            <ns3:AirShoppingProcessing/>
            <ns3:OffersGroup>
                <ns3:AirlineOffers>
                    <ns3:TotalOfferQuantity>14</ns3:TotalOfferQuantity>
                    <ns3:Owner>S7</ns3:Owner>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF1</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">7000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG1</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD1</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL1</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG1">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG1</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">1500</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 MOW5500RUB5500END XT RUB1500YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF2</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">7000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG2</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD1</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL2</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG2">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG2</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">1500</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 MOW5500RUB5500END XT RUB1500YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF3</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">7000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG3</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD1</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL3</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG3">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG3</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">1500</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 MOW5500RUB5500END XT RUB1500YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF4</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">7000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG4</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD1</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL4</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG4">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG4</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">1500</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 MOW5500RUB5500END XT RUB1500YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF5</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">7000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG5</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD1</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL5</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG5">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG5</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">5500</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">1500</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 MOW5500RUB5500END XT RUB1500YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF6</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">11900</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG6</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG7</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD2 OD3</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL6</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG6">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG6</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG7">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">W</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG7</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">2000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/LED8800 S7 MOW1100RUB9900END XT RUB2000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF7</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">11900</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG8</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG9</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD2 OD3</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL7</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG9">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">W</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG8</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG8">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG9</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">2000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/LED8800 S7 MOW1100RUB9900END XT RUB2000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF8</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">11900</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG10</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG11</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD2 OD3</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL8</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG11">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">W</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG10</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG10">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG11</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">9900</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">2000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/LED8800 S7 MOW1100RUB9900END XT RUB2000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF9</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">12600</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">10600</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG12</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG13</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD2 OD3</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL9</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG13">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG12</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG12">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG13</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">10600</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">10600</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">2000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/LED8800 S7 MOW1800RUB10600END XT RUB2000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF10</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">17000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">14000</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG14</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG15</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD4 OD5</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL10</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG14">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">N</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG14</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG15">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">Q</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG15</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">14000</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">14000</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">3000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/HTA5000 S7 MOW9000RUB14000END XT RUB3000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF11</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">18900</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG16</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG17</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD6 OD7</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL11</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG16">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG16</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG17">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG17</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">3000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/IKT5400 S7 MOW10500RUB15900END XT RUB3000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF12</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">18900</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG18</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG19</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD6 OD7</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL12</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG19">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG18</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG18">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">S</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG19</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">15900</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">3000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/IKT5400 S7 MOW10500RUB15900END XT RUB3000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF13</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">20000</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">17000</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG20</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG21</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD8 OD9</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL13</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG21">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">O</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG20</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG20">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">T</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG21</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">17000</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">17000</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">3000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/YKS11500 S7 MOW5500RUB17000END XT RUB3000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                    <ns3:AirlineOffer>
                        <ns3:OfferID Owner="S7">OF14</ns3:OfferID>
                        <ns3:TotalPrice>
                            <ns3:DetailCurrencyPrice>
                                <ns3:Total Code="RUB">24950</ns3:Total>
                                <ns3:Fees>
                                    <ns3:Total>0</ns3:Total>
                                </ns3:Fees>
                            </ns3:DetailCurrencyPrice>
                        </ns3:TotalPrice>
                        <ns3:PricedOffer>
                            <ns3:OfferPrice>
                                <ns3:RequestedDate>
                                    <ns3:PriceDetail>
                                        <ns3:BaseAmount Code="RUB">21950</ns3:BaseAmount>
                                    </ns3:PriceDetail>
                                    <ns3:Associations>
                                        <ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG22</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                            <ns3:OtherAssociation>
                                                <ns3:Type>FARE</ns3:Type>
                                                <ns3:ReferenceValue>FG23</ns3:ReferenceValue>
                                            </ns3:OtherAssociation>
                                        </ns3:OtherAssociation>
                                    </ns3:Associations>
                                    <ns3:Associations>
                                        <ns3:AssociatedTraveler>
                                            <ns3:TravelerReferences>SH1</ns3:TravelerReferences>
                                        </ns3:AssociatedTraveler>
                                        <ns3:ApplicableFlight>
                                            <ns3:OriginDestinationReferences>OD10 OD11</ns3:OriginDestinationReferences>
                                            <ns3:FlightReferences>FL14</ns3:FlightReferences>
                                            <ns3:FlightSegmentReference ref="SEG22">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">V</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG22</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                            <ns3:FlightSegmentReference ref="SEG23">
                                                <ns3:ClassOfService>
                                                    <ns3:Code SeatsLeft="9">T</ns3:Code>
                                                </ns3:ClassOfService>
                                                <ns3:BagDetailAssociation>
                                                    <ns3:CheckedBagReferences>BG23</ns3:CheckedBagReferences>
                                                </ns3:BagDetailAssociation>
                                            </ns3:FlightSegmentReference>
                                        </ns3:ApplicableFlight>
                                        <ns3:OfferDetailAssociation>
                                            <ns3:OfferPenaltyReferences>PL1</ns3:OfferPenaltyReferences>
                                        </ns3:OfferDetailAssociation>
                                    </ns3:Associations>
                                </ns3:RequestedDate>
                                <ns3:FareDetail>
                                    <ns3:FareComponent>
                                        <ns3:Parameters Quantity="1"/>
                                        <ns3:PriceBreakdown>
                                            <ns3:Price>
                                                <ns3:BaseAmount Code="RUB">21950</ns3:BaseAmount>
                                                <ns3:FareFiledIn>
                                                    <ns3:BaseAmount Code="RUB">21950</ns3:BaseAmount>
                                                </ns3:FareFiledIn>
                                                <ns3:Taxes>
                                                    <ns3:Total Code="RUB">3000</ns3:Total>
                                                    <ns3:Breakdown>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                        <ns3:Tax>
                                                            <ns3:Amount Code="RUB">1500</ns3:Amount>
                                                            <ns3:TaxCode>YR</ns3:TaxCode>
                                                        </ns3:Tax>
                                                    </ns3:Breakdown>
                                                </ns3:Taxes>
                                            </ns3:Price>
                                        </ns3:PriceBreakdown>
                                    </ns3:FareComponent>
                                    <ns3:Remarks>
                                        <ns3:Remark>20MAR17OVB S7 X/NSK9300 S7 MOW12650RUB21950END XT RUB3000YR</ns3:Remark>
                                    </ns3:Remarks>
                                </ns3:FareDetail>
                            </ns3:OfferPrice>
                        </ns3:PricedOffer>
                    </ns3:AirlineOffer>
                </ns3:AirlineOffers>
            </ns3:OffersGroup>
            <ns3:DataLists>
                <ns3:AnonymousTravelerList>
                    <ns3:AnonymousTraveler ObjectKey="SH1">
                        <ns3:PTC Quantity="1">ADT</ns3:PTC>
                    </ns3:AnonymousTraveler>
                </ns3:AnonymousTravelerList>
                <ns3:CheckedBagAllowanceList>
                    <ns3:CheckedBagAllowance ListKey="BG1">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG2">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG3">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG4">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG5">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG6">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG7">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG8">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG9">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG10">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG11">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG12">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG13">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG14">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG15">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG16">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG17">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG18">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG19">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG20">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG21">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG22">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                    <ns3:CheckedBagAllowance ListKey="BG23">
                        <ns3:AllowanceDescription>
                            <ns3:ApplicableParty>Traveller</ns3:ApplicableParty>
                            <ns3:Descriptions>
                                <ns3:Description>
                                    <ns3:Text>0PC</ns3:Text>
                                </ns3:Description>
                            </ns3:Descriptions>
                        </ns3:AllowanceDescription>
                    </ns3:CheckedBagAllowance>
                </ns3:CheckedBagAllowanceList>
                <ns3:FareList>
                    <ns3:FareGroup refs="SEG1" ListKey="FG1">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC1</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG2" ListKey="FG2">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC2</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG3" ListKey="FG3">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC3</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG4" ListKey="FG4">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC4</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG5" ListKey="FG5">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC5</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG6" ListKey="FG6">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC6</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG7" ListKey="FG7">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>WBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC7</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG8" ListKey="FG8">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC8</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG9" ListKey="FG9">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>WBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC9</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG10" ListKey="FG10">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC10</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG11" ListKey="FG11">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>WBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC11</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG12" ListKey="FG12">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC12</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG13" ListKey="FG13">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC13</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG14" ListKey="FG14">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>NBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC14</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>NBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG15" ListKey="FG15">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>QBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC15</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>QBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG16" ListKey="FG16">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC16</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG17" ListKey="FG17">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC17</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG18" ListKey="FG18">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC18</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG19" ListKey="FG19">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>SBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC19</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG20" ListKey="FG20">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>TBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC20</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>TBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG21" ListKey="FG21">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>OBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC21</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG22" ListKey="FG22">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>VBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC22</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>VBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                    <ns3:FareGroup refs="SEG23" ListKey="FG23">
                        <ns3:Fare>
                            <ns3:FareCode>
                                <ns3:Code>TBSOW</ns3:Code>
                            </ns3:FareCode>
                            <ns3:FareDetail>
                                <ns3:FareComponent/>
                                <ns3:PriceClassReference>PC23</ns3:PriceClassReference>
                            </ns3:FareDetail>
                        </ns3:Fare>
                        <ns3:FareBasisCode>
                            <ns3:Code>TBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                    </ns3:FareGroup>
                </ns3:FareList>
                <ns3:FlightSegmentList>
                    <ns3:FlightSegment SegmentKey="SEG1">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>16:05</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>16:25</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>182</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1732</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H20M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG2">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:45</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>12:05</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>184</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1732</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H20M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG3">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>06:40</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>07:00</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>178</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1732</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H20M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG4">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>20:45</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>21:05</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>176</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1732</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H20M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG5">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>08:35</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>08:55</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>174</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A321</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1732</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H20M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG6">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>12:10</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3339</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1923</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H45M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG7">
                        <ns3:Departure>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>20:45</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>22:10</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>44</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>414</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT1H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG8">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>12:10</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3339</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1923</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H45M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG9">
                        <ns3:Departure>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>14:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>15:50</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>40</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>414</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT1H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG10">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>12:10</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3339</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1923</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H45M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG11">
                        <ns3:Departure>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>23:00</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>00:25</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>42</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A319</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>414</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT1H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG12">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>12:10</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3339</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1923</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H45M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG13">
                        <ns3:Departure>
                            <ns3:AirportCode>LED</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>17:35</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>1</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>19:00</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>50</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>414</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT1H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG14">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>02:20</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>HTA</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>07:20</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3265</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">N</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1264</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT3H0M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG15">
                        <ns3:Departure>
                            <ns3:AirportCode>HTA</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>10:00</ns3:Time>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>11:00</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>118</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">Q</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>2936</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT7H0M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG16">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>02:25</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>IKT</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>05:50</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3275</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>906</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT2H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG17">
                        <ns3:Departure>
                            <ns3:AirportCode>IKT</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>09:35</ns3:Time>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>10:50</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>777</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A321</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>2613</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT6H15M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG18">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>23:15</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>IKT</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>02:40</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3511</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>906</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT2H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG19">
                        <ns3:Departure>
                            <ns3:AirportCode>IKT</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>09:35</ns3:Time>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>10:50</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>777</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A321</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>2613</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT6H15M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG20">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>23:05</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>YKS</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>04:55</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3251</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">T</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1723</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT3H50M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG21">
                        <ns3:Departure>
                            <ns3:AirportCode>YKS</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>10:50</ns3:Time>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-21</ns3:Date>
                            <ns3:Time>12:00</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>110</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>3041</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT7H10M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG22">
                        <ns3:Departure>
                            <ns3:AirportCode>OVB</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>05:10</ns3:Time>
                            <ns3:Terminal>
                                <ns3:Name>A</ns3:Name>
                            </ns3:Terminal>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>NSK</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>08:00</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>3277</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Airbus A320-100/200</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">V</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>998</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT2H50M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                    <ns3:FlightSegment SegmentKey="SEG23">
                        <ns3:Departure>
                            <ns3:AirportCode>NSK</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>08:45</ns3:Time>
                        </ns3:Departure>
                        <ns3:Arrival>
                            <ns3:AirportCode>DME</ns3:AirportCode>
                            <ns3:Date>2017-03-20</ns3:Date>
                            <ns3:Time>09:10</ns3:Time>
                        </ns3:Arrival>
                        <ns3:MarketingCarrier>
                            <ns3:AirlineID>S7</ns3:AirlineID>
                            <ns3:FlightNumber>2252</ns3:FlightNumber>
                        </ns3:MarketingCarrier>
                        <ns3:OperatingCarrier>
                            <ns3:AirlineID>GH</ns3:AirlineID>
                            <ns3:Name>GLOBUS</ns3:Name>
                        </ns3:OperatingCarrier>
                        <ns3:Equipment>
                            <ns3:AircraftCode>ref</ns3:AircraftCode>
                            <ns3:AirlineEquipCode>Boeing 737-800 Passenger</ns3:AirlineEquipCode>
                        </ns3:Equipment>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">T</ns3:Code>
                        </ns3:ClassOfService>
                        <ns3:FlightDetail>
                            <ns3:FlightDistance>
                                <ns3:Value>1779</ns3:Value>
                                <ns3:UOM>Miles</ns3:UOM>
                            </ns3:FlightDistance>
                            <ns3:FlightDuration>
                                <ns3:Value>PT4H25M</ns3:Value>
                            </ns3:FlightDuration>
                        </ns3:FlightDetail>
                    </ns3:FlightSegment>
                </ns3:FlightSegmentList>
                <ns3:FlightList>
                    <ns3:Flight FlightKey="FL1">
                        <ns3:SegmentReferences>SEG1</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL2">
                        <ns3:SegmentReferences>SEG2</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL3">
                        <ns3:SegmentReferences>SEG3</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL4">
                        <ns3:SegmentReferences>SEG4</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL5">
                        <ns3:SegmentReferences>SEG5</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL6">
                        <ns3:SegmentReferences>SEG6 SEG7</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL7">
                        <ns3:SegmentReferences>SEG8 SEG9</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL8">
                        <ns3:SegmentReferences>SEG10 SEG11</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL9">
                        <ns3:SegmentReferences>SEG12 SEG13</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL10">
                        <ns3:SegmentReferences>SEG14 SEG15</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL11">
                        <ns3:SegmentReferences>SEG16 SEG17</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL12">
                        <ns3:SegmentReferences>SEG18 SEG19</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL13">
                        <ns3:SegmentReferences>SEG20 SEG21</ns3:SegmentReferences>
                    </ns3:Flight>
                    <ns3:Flight FlightKey="FL14">
                        <ns3:SegmentReferences>SEG22 SEG23</ns3:SegmentReferences>
                    </ns3:Flight>
                </ns3:FlightList>
                <ns3:OriginDestinationList>
                    <ns3:OriginDestination OriginDestinationKey="OD8">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>YKS</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL13</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD1">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL1 FL2 FL3 FL4 FL5</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD3">
                        <ns3:DepartureCode>LED</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL6 FL7 FL8 FL9</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD10">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>NSK</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL14</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD5">
                        <ns3:DepartureCode>HTA</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL10</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD2">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>LED</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL6 FL7 FL8 FL9</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD6">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>IKT</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL11 FL12</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD7">
                        <ns3:DepartureCode>IKT</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL11 FL12</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD9">
                        <ns3:DepartureCode>YKS</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL13</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD4">
                        <ns3:DepartureCode>OVB</ns3:DepartureCode>
                        <ns3:ArrivalCode>HTA</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL10</ns3:FlightReferences>
                    </ns3:OriginDestination>
                    <ns3:OriginDestination OriginDestinationKey="OD11">
                        <ns3:DepartureCode>NSK</ns3:DepartureCode>
                        <ns3:ArrivalCode>DME</ns3:ArrivalCode>
                        <ns3:FlightReferences>FL14</ns3:FlightReferences>
                    </ns3:OriginDestination>
                </ns3:OriginDestinationList>
                <ns3:PenaltyList>
                    <ns3:Penalty/>
                    <ns3:Penalty refs="FG1 FG2 FG3 FG4 FG5 FG6 FG8 FG10 FG12 FG14 FG17 FG19 FG20 FG22" ObjectKey="PL1">
                        <ns3:Details>
                            <ns3:Detail>
                                <ns3:Type>PDE</ns3:Type>
                                <ns3:Amounts>
                                    <ns3:Amount>
                                        <ns3:CurrencyAmountValue Code="RUB">3000</ns3:CurrencyAmountValue>
                                        <ns3:AmountApplication>MinimumPenaltyAmount</ns3:AmountApplication>
                                    </ns3:Amount>
                                    <ns3:Amount>
                                        <ns3:CurrencyAmountValue Code="RUB">3000</ns3:CurrencyAmountValue>
                                        <ns3:AmountApplication>MaximumPenaltyAmount</ns3:AmountApplication>
                                    </ns3:Amount>
                                </ns3:Amounts>
                            </ns3:Detail>
                            <ns3:Detail>
                                <ns3:Amounts>
                                    <ns3:Amount>
                                        <ns3:CurrencyAmountValue Code="RUB">5000</ns3:CurrencyAmountValue>
                                        <ns3:AmountApplication>MinimumPenaltyAmount</ns3:AmountApplication>
                                    </ns3:Amount>
                                    <ns3:Amount>
                                        <ns3:CurrencyAmountValue Code="RUB">5000</ns3:CurrencyAmountValue>
                                        <ns3:AmountApplication>MaximumPenaltyAmount</ns3:AmountApplication>
                                    </ns3:Amount>
                                </ns3:Amounts>
                            </ns3:Detail>
                        </ns3:Details>
                    </ns3:Penalty>
                </ns3:PenaltyList>
                <ns3:PriceClassList>
                    <ns3:PriceClass ObjectKey="PC1">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC2">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC3">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC4">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC5">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC6">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC7">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC8">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC9">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC10">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC11">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>WBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">W</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC12">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC13">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC14">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>NBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">N</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC15">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>QBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">Q</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC16">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC17">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC18">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC19">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>SBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">S</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC20">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>TBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">T</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC21">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>OBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">O</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC22">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>VBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">V</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                    <ns3:PriceClass ObjectKey="PC23">
                        <ns3:Name>PriceClass</ns3:Name>
                        <ns3:FareBasisCode>
                            <ns3:Code>TBSOW</ns3:Code>
                        </ns3:FareBasisCode>
                        <ns3:ClassOfService>
                            <ns3:Code SeatsLeft="9">T</ns3:Code>
                            <ns3:MarketingName>ECONOMY</ns3:MarketingName>
                        </ns3:ClassOfService>
                    </ns3:PriceClass>
                </ns3:PriceClassList>
            </ns3:DataLists>
            <ns3:Metadata>
                <ns3:Other>
                    <ns3:OtherMetadata>
                        <ns3:RuleMetadatas>
                            <ns3:RuleMetadata MetadataKey="lowfare">
                                <ns3:RuleID>lowfare_rule</ns3:RuleID>
                                <ns3:Remarks>
                                    <ns3:Remark>circuityLimit:3</ns3:Remark>
                                    <ns3:Remark>durationLimit:5</ns3:Remark>
                                </ns3:Remarks>
                            </ns3:RuleMetadata>
                        </ns3:RuleMetadatas>
                    </ns3:OtherMetadata>
                </ns3:Other>
            </ns3:Metadata>
        </ns3:AirShoppingRS>
    </ns2:Body>
  </ns2:Envelope>
  """

  bench "xml parsing" do
    {doc, _} = @xml |> :binary.bin_to_list |> :xmerl_scan.string
    IO.puts("xml parse done")
    IO.inspect(doc)
  end

end
