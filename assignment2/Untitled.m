A=[1,1,0;2,1,-1;-1,1,-1];
B=[0,1,3;2,1,1;-1,-1,2];
C=[1,2,-3;2,4,2;-1,0,3];
D=[0,1,0;1,0,2;-2,1,0];
[L,U,P] =lu(A)
[L,U,P]=lu(B)
[L,U,P]=lu(C)
[L,U,P]=lu(D)