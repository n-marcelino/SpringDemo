package com.example.demo;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

public class VirtualThreadParallelSum {
    public static void main(String[] args) throws Exception {


        //executor.invokeAll()
        Executors.newVirtualThreadPerTaskExecutor().execute(()->tmp());

        Thread.sleep(999999999);
//        int leftResult = leftFuture.get();
//        System.out.println("*******************************************");
//        System.out.println("leftResult" + leftResult);
//        System.out.println("*******************************************");
//        int rightResult = rightFuture.get();
//        System.out.println("*******************************************");
//        System.out.println("leftResult" + rightResult);
//        System.out.println("*******************************************");

        //System.out.println("Sum: " + (leftResult + rightResult));
        //executor.shutdown();

    }

    static void tmp(){
        int[] array = new int[10000];
        for (int i = 0; i < array.length; i++) {
            array[i] = i;
        }

        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            int mid = array.length / 2;

            AtomicInteger done = new AtomicInteger(2);

            Future<Integer> leftFuture = executor.submit(() -> {
                int sum = 0;
                for (int i = 0; i < mid; i++) {
                    System.out.println("leftFuture" + i);
                    sum += array[i];
                }
                done.getAndDecrement();
                System.out.println("done" + done.get());
                if(done.get()==0){
                    executor.shutdown();
                }
                System.out.println("executor.isShutdown()" + executor.isShutdown());
                return sum;
            });

            Future<Integer> rightFuture = executor.submit(() -> {
                int sum = 0;
                for (int i = mid; i < array.length; i++) {
                    System.out.println("rightFuture" + i);
                    sum += array[i];
                }
                done.getAndDecrement();
                System.out.println("done" + done.get());
                if(done.get()==0){
                    executor.shutdown();
                }
                System.out.println("executor.isShutdown()" + executor.isShutdown());
                return sum;
            });
        }

    }
}

