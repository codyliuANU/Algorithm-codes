import java.util.Scanner;

public class KnapSack01 {
    public static void main(String[] args) {
        Scanner sr = new Scanner(System.in);
        System.out.println("Give a capacity of the bag");
        int c = sr.nextInt();
        System.out.println("Give a number of items");
        int i = sr.nextInt();
        System.out.println("Give a sequence of profits of items");
        int[] p = new int[i];
        int k = 0;
        while (k < i){
            p[k] = sr.nextInt();
            k++;
        }
        System.out.println("Give a sequence of weights of items");
        int[] w = new int[i];
        int q = 0;
        while (q < i){
            w[q] = sr.nextInt();
            q++;
        }
        System.out.println("---------Start Computing-------------");

        int[][] P = new int[i+1][c+1];
        for (int j = 0; j<= i; j++){
            for (int m = 0; m<= c; m++){
                if (j == 0 || m == 0)
                    P[j][m] = 0;
                else if (w[j-1] > m){
                    P[j][m] = P[j-1][m];
                }
                else{
                    P[j][m] = Math.max(P[j-1][m],P[j-1][m-w[j-1]] + p[j-1]);
                }

            }
        }

        for (int r = 0; r < P.length;r++){
            for (int j = 0; j<P[0].length;j++){
                System.out.print(P[r][j] + " ");
            }
            System.out.print("\n");
        }
    }
}
