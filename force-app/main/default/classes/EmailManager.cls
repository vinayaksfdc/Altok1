public class EmailManager {
    // Public method
        public  void sendMail(String address, String subject, String body) 
        {
            // Create an email message object
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {address};
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            String[] tobody = new String[] {body};
            mail.setPlainTextBody(body);
            // Pass this email message to the built-in sendEmail     method of the Messaging class
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] 
                                {
                mail });
        }
}