public class ex1 {
    public wrap wr{set;get;}
    public string Wname {set;get;}
    public list<wrap> res{set;get;}
   // public string firstname{set;get;}
   // public string lastname{set;get;}    
    //public string name {set;get;}
    
    public ex1()
    {
        res=new list<wrap>();
     }
    public void execute()
    {
        wr=new wrap();
        Wr.name=Wname;
        res.add(wr);
    }
}