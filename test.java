import java.util.Scanner;

public class test {
    public static void main(String[] args){
        Scanner sr = new Scanner(System.in);
        int a = sr.nextInt();
        int b = sr.nextInt();
        int result = 0;
        for (int i = a; i<=b;i++){
            result += i;
        }
        System.out.println(a);
        System.out.println("");
        System.out.println(result);

    }
}
