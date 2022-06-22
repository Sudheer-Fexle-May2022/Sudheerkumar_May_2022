public class Registrar_Layout_Data {
    public Registrar_Layout_Data(){
        Student__c s1=new Student__c();
        //Student Personal Info
        s1.name='XYZ';
        s1.Roll_Number__c=98765;
        s1.Email__c='sks@gmail.com';
        s1.Father_Name__c='abc';
        s1.Mobile_Number__c=1234567890;
        s1.Father_Mobile_Number__c=2143546577;
        s1.Email__c='sks12@gmail.com';
        s1.Overall_Grade__c='A'; 
        s1.Home_Phone__c=1212121212;
        s1.Address__c='Uttar-Pradesh';
        //Class Info
        s1.Stream__c='Computer Science And Engg';
        s1.Class__c=14;
        s1.Section__c=16;
        //Fees Details:
        s1.Current_Year__c=2022;
        s1.Fees_Submitted__c=True;
        s1.Pending_Fees_Amount__c=0;
        s1.Exam_Fees_Submitted__c=True;
        s1.Pending_Exam_Fees__c=0;
        s1.Is_Donation__c=False;
        s1.Donation_Amount__c=0;
        s1.Pending_Overall_Amount__c=0;
        s1.Donation_Amount__c=1342;
        //Bank Details:
        s1.Bank_Name__c='Axis Bank';
        s1.Account_Number__c=1700170012;
        s1.Mobile_Number__c=1212221222;
        s1.Bank_Phone_Number__c=1234567890;
        s1.IFSC_Code__c='sdwwde122s';
        s1.City__c='Bareilly';
        s1.State__c='Uttar Pradesh';
        insert s1;
        system.debug('Insertd Data:'+s1.id);
       
       List<Student__c> studentList = [select id,Name, Email__c, Address__c, Roll_Number__c,Mobile_Number__c, Father_Name__c, 
                                        Overall_Grade__c, Father_Mobile_Number__c,Stream__c, 
                                        Class__c, Section__c, Current_Year__c,Pending_Fees_Amount__c, Pending_Exam_Fees__c, 
                                        Fees_Submitted__c, Exam_Fees_Submitted__c, Is_Donation__c, Donation_Amount__c, Pending_Overall_Amount__c,
                                        Bank_Name__c,Bank_Phone_Number__c, IFSC_Code__c, State__c, City__c
                                        from Student__c order by createdDate DESC LIMIT 5];
        for(Student__c student : studentList){
            system.debug('Chck Student Data ::: ' + student);
        } 
                                        
    }
}