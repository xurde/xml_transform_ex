use Mix.Config

config :xml_transform, soap: [
    soap_namespace: "soapenv",
    namespace_list: [
      AirShopping: [AirShoppingRQ: "ns3:"],
      SeatAvailability: [SeatAvailabilityRQ: "ns3:"],
      FlightPrice: [FlightPriceRQ: "ns3:"],
      OrderCreate: [OrderCreateRQ: "ns3:"],
      ItinReshop: [ItinReshopRQ: "ns3:"],
      BaggageCharges: [BaggageChargesRQ: "ns3:", Travelers: "edis:"],
      OrderChange: [OrderChangeRQ: "ns3:", Passengers: "edis:"],
      OrderCancel: [OrderCancelRQ: "ns3:"],
      OrderRetrieve: [OrderRetrieveRQ: "ns3:"]
    ],
    request_namespace: "soapenv",
    response_namespace: "ns3",
    response_namespace_tags: "ns2",
    soap_header: "soapenv:Header",
    attributes: [
      AirShopping: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=>"http://schemas.xmlsoap.org/soap/envelope/"},
      ],
      FlightPrice: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ],
      SeatAvailability: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ],
      OrderCreate: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ],
      ItinReshop: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ],
      BaggageCharges: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/", "xmlns:edis"=> "http://www.iata.org/IATA/EDIST"}
      ],
      OrderChange: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/", "xmlns:edis"=> "http://www.iata.org/IATA/EDIST"}
      ],
      OrderCancel: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ],
      OrderRetrieve: [
        envelope: %{"xmlns:ns3"=>"http://www.iata.org/IATA/EDIST", "xmlns:soapenv"=> "http://schemas.xmlsoap.org/soap/envelope/"}
      ]
    ]
  ]
