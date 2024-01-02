file=$1
awk '/Empirical Formula/{natom=$(NF-1)}
/ORIENTATION OF MOLECULE IN FORCE CALCULATION/{getline;getline;getline;
for(i=1;i<=natom;i++){getline;l[i]=$2;x[i]=$3;y[i]=$4;z[i]=$5} }

/NORMAL COORDINATE ANALYSIS/{
for(i=1;i<=7;i++){getline}
  f1=$1
  if(f1<1) {getline; for(j=1;j<=3*natom;j++) {getline;DX[j]=$2}
	   for(n=1;n<=natom;n++) print l[n],x[n]+2*DX[3*n-2],y[n]+2*DX[3*n-1],z[n]+2*DX[3n]
  }
  else     { for(n=1;n<=natom;n++) print l[n],x[n],y[n],z[n] }
}' $file
