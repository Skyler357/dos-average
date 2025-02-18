# what i need
# (1)atomic number of O, (2)atom name of central atom.
# my destination: Manually enter the atomic number xx, copying the upper file dosxx in for processing

#==========manually enter=====================
o1="79 80 76 95"
o2="78 93 90 75"
o3="49 50 46 65"
an="pb"
an_xuhao="14"
#===========================================

#cp ../dos$an_xuhao.dat .
ln -s ../dos$an_xuhao.dat
awk '{print $1}' dos$an_xuhao.dat > x.dat

#rm o1bi.dat o2bi.dat o3bi.dat

#Bi-O1==============================================================================================================
#sum each dos orbital of one atom and put it in f$i
for i in $o1
do
    ln -s ../dos$i.dat
    awk '{sum = 0; for(i=2; i<=NF; i++) sum += $i; $11 = sum; print}' dos$i.dat > dos_sum$i.dat
    awk '{print $11}' dos_sum$i.dat > f$i
done
#copy each atom'dos in one file and average it
cp x.dat o1$an.dat
for i in f*
do 
    paste  o1$an.dat $i > temp.dat
    mv temp.dat o1$an.dat
done
awk '{sum = $2 + $3 + $4 + $5; avg = sum / 4; print $0, avg}' o1$an.dat > ave_o1$an.dat
rm f*
#==================================================================================================================

#Bi-O2==============================================================================================================
#sum each dos orbital of one atom and put it in f$i
for i in $o2
do
    ln -s ../dos$i.dat
    awk '{sum = 0; for(i=2; i<=NF; i++) sum += $i; $11 = sum; print}' dos$i.dat > dos_sum$i.dat
    awk '{print $11}' dos_sum$i.dat > f$i
done
#copy each atom'dos in one file and average it
cp x.dat o2$an.dat
for i in f*
do
    paste  o2$an.dat $i > temp.dat
    mv temp.dat o2$an.dat
done
awk '{sum = $2 + $3 + $4 + $5; avg = sum / 4; print $0, avg}' o2$an.dat > ave_o2$an.dat
rm f*
#====================================================================================================================

#Bi-O3=============================================================================================================
#sum each dos orbital of one atom and put it in f$i
for i in $o3
do
    ln -s ../dos$i.dat
    awk '{sum = 0; for(i=2; i<=NF; i++) sum += $i; $11 = sum; print}' dos$i.dat > dos_sum$i.dat
    awk '{print $11}' dos_sum$i.dat > f$i
done
#copy each atom'dos in one file and average it
cp x.dat o3$an.dat
for i in f*
do
    paste  o3$an.dat $i > temp.dat
    mv temp.dat o3$an.dat
done
awk '{sum = $2 + $3 + $4 + $5; avg = sum / 4; print $0, avg}' o3$an.dat > ave_o3$an.dat
#==================================================================================================================

rm f*
