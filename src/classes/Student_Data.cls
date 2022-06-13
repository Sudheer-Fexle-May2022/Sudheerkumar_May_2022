public class Student_Data {
    public Student_Data(){
        //Insreting the details of student
        Student__c s1=new Student__c();
        s1.name='XYZ';
        s1.Roll_Number__c=98765;
        s1.Address__c='Uttar-Pradesh';
        s1.Email_Address__c='sks@fexle.com';
        s1.Father_Mobile_Number__c=1212121212;
		s1.Address__c='Bareilly_Uttar-Pradesh';
        s1.Home_Phone__c=1212121212;
        //Class Info:
        s1.Stream__c='CSE';
        s1.Section__c='B';
        //Fees Details:
        s1.Current_Year__c=4;
        s1.Fees_Submitted__c='Yes';
        s1.Pending_Exam_Fees__c=0;
        s1.Exam_Fees_Submitted__c='Yes';
        s1.Pending_Fees_Amount__c=00; 
        insert s1;
        //Querry for 5 students
        List<Student__c> stuList=[select name,Roll_Number__c,Address__c,Email_Address__c from Student__c order by createdDate DESC LIMIT 5];
        for(Student__c student:stuList){
            system.debug('Analyze Student_Data:-->'+student);
        }
         
    } 
}