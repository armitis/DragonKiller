#!/usr/bin/python3



def bubble_sort(array):
	length = len(array)
	for x in range(0, length - 1):
		for y in range(0, length - 1 - x):
			temp = array[y]
			if array[y] > array[y+1]:
				array[y] = array[y+1]
				array[y+1] = temp


def insert_sort(array):
	length = len(array)
	for x in range(1, length):
		