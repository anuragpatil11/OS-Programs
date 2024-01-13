/*Implement the C program in which main program accepts the
integers to be sorted. Main program uses the FORK system call to
create a new process called a child process. Parent process
sorts the integers using sorting algorithm and waits for child
process using WAIT system call to sort the integers using any
*/
//sorting algorithm
#include<stdio.h> //Header file for input and output functions
#include<unistd.h> //Header file for process functions
#include<sys/types.h>
#include<sys/wait.h>
void asc_sort(int a[30],int n) //Sorting function in ascending order
{
int i,j,temp; //local variables of function
for(i=0;i<n;i++)
{
for(j=0;j<n-1;j++)
{
if(a[j]>a[j+1]) //condition for ascending sorting
{
temp=a[j];
a[j]=a[j+1];
a[j+1]=temp;
}
}
}
printf("Ascending Order \n");
for(i=0;i<n;i++)
{
printf("\t%d",a[i]); //printing the sorted array
}
printf("\n");
}
void des_sort(int a[30],int n) //sorting function in descending order
{
int i,j,temp; //local variables of function
for(i=0;i<n;i++)
{
for(j=0;j<n-1;j++)
{
if(a[j]<a[j+1]) //condition for descending sorting
{
temp=a[j];
a[j]=a[j+1];
a[j+1]=temp;
}
}
}
printf("Descending Order \n");
for(i=0;i<n;i++)
{
printf("\t%d",a[i]); //printing sorted array
}
printf("\n");
}
int main() //main function
{
int a[30],n,i; //local variable of main function
printf("Enter size of array to be sorted:");
scanf("%d",&n); //user acceptance for array size
for(i=0;i<n;i++)
{
printf("Please enter the %dth array elements:",i+1);
scanf("%d",&a[i]); //user acceptance for array elements
}
if(fork()==0) //condtion for checking child creation
{
printf("\nChild process id=%d\n",getpid());
//getting child process id
des_sort(a,n); //calling descending sort function
}
else
{
wait(NULL); //sleep(10);
//parent wait for child to finish execution
printf("\nParent process id=%d\n",getppid());
//grtting parent process id
asc_sort(a,n); //calling ascending sort function
}
return 0;
}
