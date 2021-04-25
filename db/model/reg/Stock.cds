namespace WM.model.reg;

using { cuid } from '@sap/cds/common';
using { WM.model.cat.Product } from '../cat/Product';
using { WM.model.cat.UOM } from '../cat/UOM';
using { WM.model.cat.Location } from '../cat/Location';

entity Stock : cuid {
    Product     : Association to one Product;
    Location    : Association to one Location;
    Quantity    : Decimal(17,3);
    UOM         : Association to one UOM;
}

annotate WM.model.reg.Stock with @(
        UI.LineItem : [
        {
            Value: ID,
            Label: 'ID'
        },
        {
            Value: Product.Name,
            Label: 'Product'
        },
        {
            Value: Location.Name,
            Label: 'Location'
        },
        {
            Value: Quantity,
            Label: 'Quantity'
        },
        {
            Value: UOM.name,
            Label: 'UOM'
        }
    ]
);