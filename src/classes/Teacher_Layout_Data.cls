public class Teacher_Layout_Data {
    public Teacher_Layout_Data(){
        Student__c s2=new Student__c();
        //Student Personal Info
        s2.name='XYZ';
        s2.Roll_Number__c=98765;
        s2.Email__c='sks@gmail.com';
        s2.Father_Name__c='abc';
        s2.Mobile_Number__c=1234567890;
        s2.Father_Mobile_Number__c=2143546577;
        s2.Email__c='sks12@gmail.com';
        s2.Overall_Grade__c='A'; 
        s2.Home_Phone__c=1212121212;
        s2.Address__c='Uttar-Pradesh';
        //Class Info
        s2.Stream__c='CSE';
        s2.Class__c=12;
        s2.Section__c=14;
        //Fees Details
        s2.Current_Year__c=2022;
        s2.Fees_Submitted__c=True;
        s2.Pending_Fees_Amount__c=0;
        s2.Exam_Fees_Submitted__c=True;
        s2.Pending_Exam_Fees__c=0;
        //Semester Details
        s2.X1st_Sem_Back__c=False;
        s2.X1st_Sem_Percentage__c=80;
        s2.Subject_in_which_1st_Sem_Back__c='';
        s2.X2nd_Sem_Back__c=False;
        s2.X2nd_Sem_Percentage__c=82;
        s2.Subject_in_which_2nd_Sem_Back__c='';
        s2.X3rd_Sem_Back__c=False;
        s2.X3rd_Sem_Percentage__c=84;
        s2.Subject_in_which_3rd_Sem_Back__c='';
        s2.X4rth_Sem_Back__c=False;
        s2.X4rh_Sem_Percentage__c=86;
        s2.Subject_in_which_4rth_Sem_Back__c='';
        insert s2;
        system.debug('Record Data:'+s2.id);
        
        
        List<Student__c> studentList = [select id, Name, Email__c, Address__c, Roll_Number__c,Mobile_Number__c, Father_Name__c, 
                                        Overall_Grade__c, Father_Mobile_Number__c, Stream__c, 
                                        Class__c, Section__c, Current_Year__c,Pending_Fees_Amount__c, Pending_Exam_Fees__c, 
                                        Fees_Submitted__c, Exam_Fees_Submitted__c, X1st_Sem_Percentage__c, X2nd_Sem_Percentage__c,
                                        X4rh_Sem_Percentage__c, X1st_Sem_Back__c ,X3rd_Sem_Back__c, X4rth_Sem_Back__c, 
                                        Subject_in_which_1st_Sem_Back__c, Subject_in_which_3rd_Sem_Back__c,Subject_in_which_4rth_Sem_Back__c 
                                        from Student__c order by createdDate DESC LIMIT 5];
        for(Student__c student : studentList){
            system.debug('Chck Student Data ::: ' + student);
        }
        
    }
    
    
}