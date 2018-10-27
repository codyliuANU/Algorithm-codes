public class Fraction {
    public static void main(String[] args) {
        int[] a = new int[] {4,1,2,4,2,1,8,1,2,4,2,1,8,1,2,4,2,1,8,1,2,4,2,1,8,1,2,4,2,1,8};
        int[] p = new int[a.length];
        int[] q = new int[a.length];

        for (int k = 0; k < a.length; k++){
            if(k == 0){
                p[k] = a[0];
                q[k] = 1;
            }
            else if(k == 1){
                p[k] = a[0]*a[1] + 1;
                q[k] = a[1];
            }
            else{
                p[k] = a[k]*p[k-1] + p[k-2];
                q[k] = a[k]*q[k-1] + q[k-2];
            }
        }
        for (int k = 0; k < a.length; k++) {
            System.out.print(k+" & ");
            System.out.print(a[k]+ " & ");
            System.out.print(p[k]+" & ");
            System.out.print(q[k]+" & ");

            if (((p[k]^2) - 22*(q[k]^2)) == 1) System.out.println(" True ");
            System.out.print(p[k]+ "/"+ q[k] + "\\" + "\\");

            System.out.print("\n");
        }

    }
}
