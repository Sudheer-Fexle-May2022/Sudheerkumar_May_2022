public class Registrar_Layout_Data {
    public Registrar_Layout_Data(){
        Student__c s2=new Student__c();
        //Inserting Fees Details:
        s2.Current_Year__c=2022;
        s2.Fees_Submitted__c='yes';
        s2.Pending_Fees_Amount__c=0;
        s2.Donation_Amount__c=1342;
        s2.Exam_Fees_Submitted__c='Yes';
        //inserting Bank Details:
        s2.Bank_Name__c='Axis Bank';
        s2.Bank_Phone_Number__c=1234567890;
        s2.IFSC_Code__c='sdwwde122s';
        s2.Account_Number__c=123456;
        insert s2;
        system.debug('Insertd Data:'+s2.id);
    }
}