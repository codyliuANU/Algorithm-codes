import java.util.Scanner;

public class FibDP {
    public static void main(String[] args) {
        Scanner sr = new Scanner(System.in);
        int n = sr.nextInt();
        int[] F = new int[n+1];
        F[0] = 0;
        F[1] = 1;
        F[2] = 1;
        for(int i = 3; i <= n ; i++){
            F[i] = F[i-1] + F[i-2];
        }
        System.out.println(F[n]);
    }
}
