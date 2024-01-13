#include <stdio.h>
#define MAX_PROCESSES 10
#define MAX_RESOURCES 10
int main()
{
int n, m, i, j;
printf("Enter the number of processes: ");
scanf("%d", &n);
printf("Enter the number of resources: ");
scanf("%d", &m);
int max_claim[MAX_PROCESSES][MAX_RESOURCES];
int allocation[MAX_PROCESSES][MAX_RESOURCES];
int need[MAX_PROCESSES][MAX_RESOURCES];
int available[MAX_RESOURCES];
// Input the maximum claim for each process
printf("Enter the maximum claim matrix:\n");
for (i = 0; i < n; i++)
{
printf("Process %d: ", i);
for (j = 0; j < m; j++)
{
scanf("%d", &max_claim[i][j]);
}
}
// Input the allocation matrix
printf("Enter the allocation matrix:\n");
for (i = 0; i < n; i++)
{
printf("Process %d: ", i);
for (j = 0; j < m; j++)
{
scanf("%d", &allocation[i][j]);
need[i][j] = max_claim[i][j] - allocation[i][j];
}
}
// Input the available resources
printf("Enter the available resources: ");
for (i = 0; i < m; i++)
{
scanf("%d", &available[i]);
}
// Initialize the finish array to false
int finish[MAX_PROCESSES];
for (i = 0; i < n; i++)
{
finish[i] = 0;
}
// Safety algorithm
int work[MAX_RESOURCES];
for (i = 0; i < m; i++)
{
work[i] = available[i];
}
int safe_sequence[MAX_PROCESSES];
int safe_count = 0;
while (safe_count < n)
{
int found = 0;
for (i = 0; i < n; i++)
{
if (finish[i] == 0)
{
int can_allocate = 1;
for (j = 0; j < m; j++)
{
if (need[i][j] > work[j])
{
can_allocate = 0;
break;
}
}
if (can_allocate)
{
for (j = 0; j < m; j++)
{
work[j] += allocation[i][j];
}
safe_sequence[safe_count++] = i;
finish[i] = 1;
found = 1;
}
}
}
if (!found)
{
printf("System is in an unsafe state. Deadlock detected.\n");
break;
}
}
if (safe_count == n)
{
printf("System is in a safe state. Safe sequence: ");
for (i = 0; i < n; i++)
{
printf("P%d ", safe_sequence[i]);
}
printf("\n");
// Print the process detail table
printf("\nProcess Detail Table:\n");
printf("Process\tMax\tAllocation\tNeed\n");
for (i = 0; i < n; i++)
{
printf("P%d\t", i);
for (j = 0; j < m; j++)
{
printf("%d ", max_claim[i][j]);
}
printf("\t");
for (j = 0; j < m; j++)
{
printf("%d ", allocation[i][j]);
}
printf("\t");
for (j = 0; j < m; j++)
{
printf("%d ", need[i][j]);
}
printf("\n");
}
}
return 0;
}
