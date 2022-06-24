/**
* Description   - Creating this class to relationships
*	
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 15-06-2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya Date-15-06-2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date -15-06-2022 Modifie dsome simple,and hierachical relations
*
**/
public class RelationshipCreations {
        
    /**   Description :   To insert Pancard, One to One Realtionship(Lookup Relatioship)       *
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 15-06-2022            
    **/
    //inserting pan card details
    public static void insertPanCard(){
        Pan_Card__c pc = new Pan_Card__c();
        pc.Name_on_Pan_Card__c = 'Sudheer Kumar Shakya';
        pc.Pan_Card_Number__c = 123456789;
        pc.Father_Name__c = 'M.S.Shakya';
        insert pc;
        system.debug('Inserted PanCard Data :' + pc.id);
    }
    
    
    /**   Description :   To insert College Details, One to Many Realtionship(Strong Relatioship)       
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    * 
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 15-06-2022            
    **/
    
    //inserting college details
    public static void insertingCollegedetails(){
        College__c clg = new College__c();
        clg.College_Name__c='Government Engg.College Ajmer';
        clg.College_State__c='Rajasthan';
        insert clg;
        system.debug('Inserted College Info:'+clg.id);
        
        //Teacher Info
        Teacher__c tc = new Teacher__c();
        tc.Name = 'XYZ';
        insert tc;
        system.debug('Inserted Teacher Info :' + tc.id);
        
        //Weak Realtionship
        //Year of Class Info
        Year_Of_Class__c yearofclass = new Year_Of_Class__c();
        yearofclass.Name = '4rth Year';
        insert yearofclass;
        system.debug('Inserted Year Of Class  :' + yearofclass.id);
        
        //Student Info
        Student__c stu = new Student__c();
        stu.Name = 'S.K.Shakya';
        stu.Year_of_Class__c=yearofclass.Id;
        insert stu;
        system.debug('Inserted Student Info  :' + stu.id);
        
        //Many to Many Realtionship
        //Subject Info
        Subject__c sub = new Subject__c();
        sub.Name = 'Physics';
        insert sub;
        system.debug('Inseted Subject Info :' + sub.id);
        
        //StudentSubjects Info 
        StudentSubjects__c stsb = new StudentSubjects__c();
        stsb.Name = 'Physics';
        insert stsb;
        system.debug('Inseted StudentSubjects Info :' + stsb.id);
    }   
    /**   Description :   To insert Self Relationship and Hierarchical Relationship       
	*     Created By  :   Sudheer Kumar Shakya
	*     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 23-06-2022            
    **/
    public static void insertHierarchical(){  
        
        //Self Relationship & Hierarchical Relationship
        //Employees Info        
        Employee__c emp = new Employee__c();
        Employee__c employee = [SELECT Mentor__c,Trainer__c FROM Employee__c WHERE Name LIKE 'Mr Sushil Choudhary' LIMIT 1];
        emp.Name = 'Sudheer Kumar Shakya';
        emp.Mentor__c = employee.Id ;
        emp.Trainer__c = employee.Mentor__c ;
        insert emp;
        system.debug('Inserted Employees Info :' + emp.id);
        
        //Account Info
        Account accnt = new Account();
        accnt.Name = 'GE India';
        Account accId = [SELECT Id,ParentId FROM Account WHERE Name Like 'General Electric New York US' LIMIT 1];
        accnt.ParentId = accId.ParentId;
        insert accnt;
        system.debug('Inserted the Employees Info :' + accnt.id);
        
        //inserting the Lead Info
        Lead l = new Lead();
        l.FirstName = 'Sudheer';    
        l.LastName = 'Shakya';
        l.Company = 'Fexle Services Private Ltd';
        l.Industry = 'Engineering';
        l.AnnualRevenue = 50000;
        l.Phone = '1234567890';
        l.Email = 'abc@gmail.com';
        l.Status = 'Student';
        l.Rating = 'Great';
        l.Account__c=accId.Id;
        insert l;
        system.debug('Inserted the Lead Info :' + l.id);                 
    }
}