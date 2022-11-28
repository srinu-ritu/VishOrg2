@isTest
public class LeadAccountMatchBatchTest {
    
    @testSetup static void setup(){
       List<Lead> testLeads = new List<Lead>();

       for(Integer i = 1; i <= 10; i++){
           Lead testLead = new Lead();
           testLead.FirstName='firstname';
           testLead.LastName='lastname'+i;
           testLead.MainDomain__c='testDomain'+i+'.com';
           testLead.Company='Test Company'+i;
           if(math.mod(i,2)== 0){
           		testLead.NF_CompanyLSID__c = 'a1b2c3';
           }else{
				testLead.NF_CompanyLSID__c = 'a1b2c4';
                //Srinivas Kammari
           }
           testLeads.add(testLead);
       }
       insert testLeads;
        
       List<Account> testAccounts = new List<Account>();
        
        for(Integer i=1; i<=2;i++){
            Account testAccount = new Account();
            testAccount.Name ='TestAccount'+i;
            testAccount.Maindomain__c = 'testDomain'+i+'.com';
            testAccount.BillingCountry = 'Ireland';
            testAccounts.add(testAccount);
        }
        
        insert testAccounts;
       
    }

    @isTest
    private static void test1(){
        
        List<Account> accList = [Select Id,NF_CompanyLSID__c from Account ];
        Integer i =0;
        for(Account a: accList){
            if(i==0){
            	a.NF_CompanyLSID__c = 'a1b2c3';
            }else{
                a.NF_CompanyLSID__c = 'a1b2c4';
            }
            i++;
        }
        update accList;
        
        Test.startTest();
        LeadAccountMatchSchedulable sch = new LeadAccountMatchSchedulable();
        sch.execute(null);
        Test.stopTest();
        
        
    }
}