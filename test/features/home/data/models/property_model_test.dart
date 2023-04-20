import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/features/home/data/models/property_model.dart';

main() {
  late Map<String, dynamic> json;
  late PropertyModel model;

  setUp(() {
    json = {
      "_id": {"oid": "623e13c298e444e9b843465f"},
      "property_type": "penthouse",
      "address": "Avenida Rouxinol",
      "number": "350",
      "unit": "",
      "building": "",
      "region": "Moema",
      "city": "S\u00e3o Paulo",
      "state": "SP",
      "zipcode": "04516-000",
      "lat": -23.6027637,
      "lng": -46.6714227,
      "bedrooms": null,
      "suites": null,
      "bathrooms": null,
      "parking_spots": null,
      "area": 2000,
      "total_area": null,
      "condo_fee": null,
      "tax": null,
      "asking_price": 25000000,
      "rent_price": null,
      "people": [
        {"name": "Mateuzinho", "email": "", "phone": "", "commission": 0.0222, "role": "broker"},
        {"name": "Renan", "email": "renan+comercial@soupilar.com.br", "phone": "11999999999", "role": "indicador", "commission": null}
      ],
      "frontdesk_hours": null,
      "floor": null,
      "development_stage": null,
      "features": [],
      "ad": {
        "title": "Cobertura com 2000 m\u00b2,  \u00e0 venda no bairro Moema.",
        "description": "Cobertura no bairro Moema.\nCom 2.000,00 m\u00b2 privativos, possui null quarto sendo null su\u00edte e null vagas de garagem.\n  ",
        "transaction_type": "rent",
        "destinations": ["website"],
        "type": "standard",
        "display_address": "region"
      },
      "company_id": "620eaad98feb830eee5216d7",
      "commercial_id": "CM126",
      "created_at": "2022-03-25 19:10:58",
      "images": [
        {"url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images/d95705fa-a57a-4d3a-a39d-9fa0b2597873.jpeg", "watermark_url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images-watermark/d95705fa-a57a-4d3a-a39d-9fa0b2597873.jpeg"},
        {"url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images/9f431d33-1fbb-40dd-b963-40837fd405d0.jpeg", "watermark_url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images-watermark/9f431d33-1fbb-40dd-b963-40837fd405d0.jpeg"},
        {"url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images/11beeb05-cd33-43ae-90de-4b3ed11dd655.jpeg", "watermark_url": "https://blintz-properties-sandbox.s3.amazonaws.com/6228dca765b50e16ab98b9c2/images-watermark/11beeb05-cd33-43ae-90de-4b3ed11dd655.jpeg"}
      ],
      "updated_at": "2022-05-02 18:16:56"
    };
  });

  group('Property Model |', () {
    test('should parse json.', () async {
      model = PropertyModel.fromJson(json);
      expect(model, isA<PropertyModel>());
    });

    test("address should be Avenida Rouxinol.", () async {
      model = PropertyModel.fromJson(json);
      expect(model.address, "Avenida Rouxinol");
    });
  });
}
