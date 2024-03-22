using {com.lab2dev as lab2dev} from '../db/schema.cds';

service ProductsService {
    entity Products as projection on lab2dev.Products;
    entity Orders as projection on lab2dev.Orders;
    entity Customers as projection on lab2dev.Customers;
    entity OrdersProducts as projection on lab2dev.OrderProducts;

    action SearchProducts()
}