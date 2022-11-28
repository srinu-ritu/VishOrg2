/* ***********************************************
Name:KBStatusController
Description: Scheduler calss to pull status from the mimecast status system and update in kbstaus custom setting, BUSS-8514
Change History:
Update any change history below
Date updated:--- , Modified by:--- , Description: ---
************************************************* */

global class KBStatusSchedule implements Schedulable{
    global void execute(SchedulableContext SC) {
        KBStatusCalloutClass.getKBStatus();
        //Srinivas Kammari Modified
    }
}