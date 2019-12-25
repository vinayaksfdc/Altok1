public class thomas_bayer {
    
    
    public thomas_bayer()
    {
        Map < String, String > mapCustomer = new Map < String, String >();
        String endpoint = 'http://www.thomas-bayer.com/sqlrest/CUSTOMER/1/';
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndPoint(endpoint);
        req.setMethod('GET');
        HTTPResponse res = h.send(req);
        system.debug('res is'+res);
        Dom.Document doc = res.getBodyDocument();
        system.debug('doc is'+doc);
        Dom.XMLNode customer = doc.getRootElement();
        system.debug('customer is'+customer);
        for(Dom.XMLNode child : customer.getChildElements()) {
            mapCustomer.put(child.getName(), child.getText());
        }
        system.debug(mapCustomer);
    }
}