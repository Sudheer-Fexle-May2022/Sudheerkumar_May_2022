public class Student_Data {
    public Student_Data(){
        //Insreting the details of student
        Student__c s1=new Student__c();
        s1.name='XYZ';
        s1.Roll_Number__c=98765;
        s1.Address__c='Uttar-Pradesh';
        s1.Email_Address__c='sks@fexle.com';
        insert s1;
        //Querry for 5 students
        List<Student__c> stuList=[select name,Roll_Number__c,Address__c,Email_Address__c from Student__c order by createdDate DESC LIMIT 5];
        for(Student__c student:stuList){
            system.debug('Analyze Student_Data:-->'+student);
        }
         
    } 
}