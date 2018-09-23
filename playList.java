import java.util.ArrayList;

public class playList {
    private ArrayList s;
    playList(){
        this.s = new ArrayList<Integer>();
    }

    public static void main(String[] args) {
        playList p = new playList();
        p.s.add(3);
        p.s.add(2);
        System.out.println(p.s.get(0));
    }
}
