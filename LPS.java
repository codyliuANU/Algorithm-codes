//    def LIS(arr):
//        S = [1] * len(arr)
//        for i in range(1, len(arr)):
//            for j in range(i):
//                if arr[i] > arr[j]:
//                     S[i] = max(S[i], S[j] + 1)
//            print(S)
//        return S

// S[i] = S[j] + 1
// X = [A,B,C,B,D,C,A] Y = [A,C,D,C,E,B]
// Z =[A,C,D]
// Step 1, find the optimal structure and the overlapped sub-problem
// X[i] == Y[j], Z[k] = X[i] = Y[j],Z[k] is the optimal solution for both X[i] and Y[j]
//
// X[i] != Y[j], Z[k] is the optimal solution for either (X[i-1], Y[j]) or (X[i], Y[j-1])
//
// Step 2, find the state function (state table)
// c[i][j] is our state table (the LCS's length )
// c[i][j] = c[i-1][j-1] + 1 // if X[i] == Y[j].
// c[i][j] = max(c[i-1][j], c[i][j-1])   // if X[i] != Y[j]
// c[i][j] = 0 // if i==0 , j == 0.
//
// Step 3, implement the algorithm (return optimization solution (length))
// Step 4, according to the state tasble ,to find the "Z", return array.