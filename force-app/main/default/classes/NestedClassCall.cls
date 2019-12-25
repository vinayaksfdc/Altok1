public class NestedClassCall{
    class InnerClass{
     public void show() {
      System.debug('Hello');
     }
    }
    public void showMessage(){
     InnerClass innObj = new InnerClass();
     innObj.show();
    }
   }