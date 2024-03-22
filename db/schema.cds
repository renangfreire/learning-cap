namespace com.lab2dev;

using { cuid } from '@sap/cds/common';

entity Products : cuid{
        Name : String;
        Quantity: Integer;
        Price : Decimal;
        Orders: Composition of many OrderProducts on Orders.Product = $self; 
}

entity OrderProducts : cuid {
        Product : Association to one Products @Core.AutoExpand; 
        Order : Association to one Orders @Core.AutoExpand;
}

entity Orders : cuid{
        Customer: Association to one Customers ;
        Products : Composition of many OrderProducts on Products.Order = $self;
        Ordered_at : Timestamp @cds.on.insert: $now;
        TotalValue: Decimal;
        Status: String enum {
            Pending;
            Completed;
            Canceled;
        } default 'Pending';
}

entity Customers : cuid{
        Name : String;
        Orders : Association to many Orders on Orders.Customer = $self;
}

// External
entity catFact {
        fact: String;
        length: Integer;
}