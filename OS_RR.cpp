#include <iostream>
#include<queue> 
using namespace std;

struct process{
  int pid;
  int AT;               //arrival time
  int BT;               //Burst time
  int WT;               //waiting time
  int TAT;              //Turn around time       

};


void RoundRobin(process P[10],int n,int tq)
{
  int count=0;
  int i=0;
  
  queue<process> q; 
  q.push(P[i]);
  
  while(!q.empty())
  {
  	process temp=q.front();
 	if(temp.BT>tq)
 	{
 		temp.BT=temp.BT-tq;
 		count=count+tq;
 
 	}
 	else
 	{
 	        count=count+temp.BT;
 	        temp.BT=0;
 	        for(int j=0;j<n;j++)
 	        {
				if(P[j].pid==temp.pid){
 	       	 			P[j].WT= count-P[j].AT-P[j].BT;
 	        			P[j].TAT=P[j].WT+P[j].BT;
				}
 	        }
			cout<<"process "<<temp.pid<<" ended at : "<<count<<endl;
 	        
	}
	if(P[i+1].AT <= count){
			for(int x = i+1 ; x < n ; x++){
				if(P[x].AT<=count){
					q.push(P[x]);
					i++;
				}
			}
		}
		if(temp.BT>0){
			q.push(temp);
			q.pop();
		}
		else{
			q.pop();
		}
	
  }
  
cout<<"PId\tAT\tBT\tTWT\tTAT"<<endl;
	float avgWt = 0;
	float avgTat = 0;
	for(int j = 0 ; j < n ; j++){
		process pr = P[j];
		cout<<pr.pid<<"\t"<<pr.AT<<"\t"<<pr.BT<<"\t"<<pr.WT<<"\t"<<pr.TAT<<endl;
		avgWt += pr.WT;
		avgTat+= pr.TAT;
	}
	avgWt = avgWt/n;
	avgTat = avgTat/n;
	cout<<"average waiting time : "<<avgWt<<endl;
	cout<<"average turn around time : "<<avgTat<<endl;
	
	
}
void sort(process P[10],int n)
{
	process temp;
	for(int i=0;i<n-1;i++){
		for(int j=0;j<n;j++)
		{
			if(P[j].AT>P[j+1].AT)
			{
				temp=P[j];
				P[j]=P[j+1];
				P[j+1]=temp;
			}
		}
	}
}
int main(){

	int n,tq;
	process P[10];

	cout<<"Enter The Number of Processes:";
	cin>>n;

	cout<<"Enter Arrival  Time and BurstTime of Processes";
	for(int i=0;i<n;i++)
	{
		cout<<"P"<<i+1<<":";
		P[i].pid=i;
		cin>>P[i].AT;
		cin>>P[i].BT;

	}
	//sort on the basis of arrival time
	sort(P,n);
	
	for(int j=0;j<n;j++)
	{
	 printf("%d %d %d\n",j,P[j].AT,P[j].BT);

	}
	cout<<"Enter Time Quantum";
	cin>>tq;
	RoundRobin(P,n,tq);

return 0;
}


// OUTPUT

// PS D:\OS> ./roundr.exe  
// Enter The Number of Processes:5
// Enter Arrival  Time and BurstTime of ProcessesP1:3
// 1
// P2:1
// 4
// P3:4
// 2
// P4:0
// 6
// P5:2
// 3
// 0 0 6
// 1 1 4
// 2 2 3
// 3 3 1
// 4 4 2
// Enter Time Quantum2
// process 0 ended at : 9
// process 2 ended at : 11
// process 1 ended at : 13
// process 4 ended at : 14
// process 3 ended at : 16
// PId     AT      BT      TWT     TAT
// 3       0       6       10      16
// 1       1       4       8       12
// 4       2       3       9       12
// 0       3       1       5       6
// 2       4       2       5       7
// average waiting time : 7.4
// average turn around time : 10.6
