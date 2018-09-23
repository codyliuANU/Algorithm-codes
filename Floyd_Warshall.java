import java.util.Random;

public class Floyd_Warshall {
    public void Floyd(int[][] arr){
        for (int k = 0;k < arr.length;k++){
            for (int i = 0; i < arr.length;i++){
                for (int j = 0; j < arr.length ; j++){
                    if (arr[i][j] == 1 || (arr[i][k] == 1 && arr[k][j] == 1)){
                        arr[i][j] = 1;
                    }
                }
            }
        }
    }



    public static void main(String[] args) {
        Floyd_Warshall f = new Floyd_Warshall();
        Random r = new Random();
        int length = 12;
        int[][] arr = new int[length][length];

        int[][] test = new int[][] {{1,1,1,0,0},{1,1,0,0,0},{0,0,1,0,0},{1,0,0,1,0},{0,0,0,0,1}};

        f.Floyd(test);
        System.out.println();
        for (int i = 0; i < test.length;i++){
            for (int j = 0; j<test.length;j++){
                System.out.print(test[i][j] + " ");
            }
            System.out.print("\n");
        }
    }
}
