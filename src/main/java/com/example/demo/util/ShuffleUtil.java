package com.example.demo.util;
import java.util.Random;

public class ShuffleUtil {

	// Method to shuffle an array of strings using Fisher-Yates algorithm
	public static void shuffleArray(String[] array) {
		Random rand = new Random(); // Create an instance of Random class

		for (int i = array.length - 1; i > 0; i--) {
			int j = rand.nextInt(i + 1); // Generate a random index from 0 to i (inclusive)
			// Swap array[i] with the element at random index
			String temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
	}

	// Generic method to shuffle an array of objects using Fisher-Yates algorithm
	public static <T> void shuffleArray(T[] array) {
		Random rand = new Random(); // Create an instance of Random class

		for (int i = array.length - 1; i > 0; i--) {
			int j = rand.nextInt(i + 1); // Generate a random index from 0 to i (inclusive)
			// Swap array[i] with the element at random index
			T temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
	}
}
