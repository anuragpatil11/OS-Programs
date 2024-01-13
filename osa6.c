#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<unistd.h>
#include<semaphore.h>

#define buffer_size 5
#define num_items 5

sem_t empty,full;
int in,out=0;
int buffer[buffer_size];
int itemproduced=0;
int itemconsumed=0;

void* producerFunc(void *arg){
  while(itemproduced < num_items){
    sem_wait(&empty);
    int item = rand() % 100;
    if(in==out){
      sem_wait(&empty);
    }
    
    buffer[in]=item;
    in = (in+1) % buffer_size;
    sem_post(&full);
    printf("Producer with ID(%ld) produced items %d \n",pthread_self(),item);
    itemproduced++;
  }    
}

void* consumerFunc(void *arg){
  while(itemconsumed < num_items){
    sem_wait(&full);
    //int item = rand() % 100;
    if(in==out){
      sem_post(&full);
    }
    
    int item = buffer[out];
    out = (out+1) % buffer_size;
    sem_post(&empty);
    printf("consumer with ID(%ld) consumed items %d \n",pthread_self(),item);
    itemconsumed++;
    sleep(5);
  }    
}

int main(){
  sem_init(&empty,0,buffer_size);
  sem_init(&full,0,0);
  
  pthread_t consumer_thread[3],producer_thread[3];
  
  for(int i=0;i<3;i++){
    pthread_create(&producer_thread[i],NULL,producerFunc,NULL);
  }
  for(int i=0;i<3;i++){
    pthread_create(&consumer_thread[i],NULL,consumerFunc,NULL);
  }
  
  for(int i=0;i<3;i++){
    pthread_join(producer_thread[i],NULL);
    pthread_join(consumer_thread[i],NULL);
  }

return 0;
}
