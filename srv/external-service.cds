using { com.lab2dev as lab2dev } from '../db/schema';

service ExternalService @(path: '/external'){
    @readonly
    entity fact as projection on lab2dev.catFact;
}