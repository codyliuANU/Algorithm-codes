import java.util.ArrayList;

public class LCS {
    public static void main(String[] args) {
        char X[] = new char[] {'A','B','B','C','B','C','C'};
        char Y[] = new char[] {'B','C'};
        int c[][] = new int[X.length+1][Y.length+1];
        ArrayList<Character> Z = new ArrayList<>();


        for (int i = 0; i <=X.length;i++){
            c[i][0] = 0;
        }
        for (int j = 0; j <= Y.length; j++){
            c[0][j] = 0;
        }



        for (int i = 1; i <= X.length; i++) {
            for (int j = 1; j <= Y.length; j++) {
                if (X[i - 1] == Y[j - 1]) {
                    c[i][j] = c[i-1][j-1]+1;

                }
                else
                    c[i][j] = 0;

            }
        }


        for (int i = 0; i < c.length;i++){
            for (int j = 0; j<c[0].length;j++){
                System.out.print(c[i][j] + " ");
            }
            System.out.print("\n");
        }
        System.out.println(Z);

    }
}
