public class Teacher_Layout_Data {
    public Teacher_Layout_Data(){
        Student__c s3=new Student__c();
        //insert data
        s3.Current_Year__c=2022;
        s3.Stream__c='CSE';
        s3.Subject_in_which_Back__c='none';
        s3.X1st_Sem_back__c=False;
        s3.X1st_Sem_Percentage__c=80;
        s3.X2nd_Sem_Back__c=False;
        s3.X2nd_Sem_Percentage__c=82;
        s3.X3rd_Sem_Back__c=False;
        s3.X3rd_Sem_Percentage__c=84;
        s3.X4rth_sem_back__c=False;
        s3.X4rh_sem_percentage__c=89;
         insert s3;
        system.debug('Record Data:'+s3.id);
    }
    
    
}