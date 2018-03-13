//
//  ViewController.swift
//  MergeSort
//
//  Created by Saddam Al Amin on 3/13/18.
//  Copyright © 2018 Saddam Al Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let unsorted = [0, 5, 2, 3, 4, 5, 8, 8, 9]
        print("Unsorted \(unsorted)")
        let sorted = mergeSort(unsorted)
        print("Sorted with merge sort \(sorted)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mergeSort(_ input: [Int]) -> [Int] {
        guard input.count > 1 else { // The guard statement checks the size of the input array
            return input
        }
        
        let splitIndex = input.count / 2
        let leftArray = mergeSort(Array(input[0..<splitIndex]))
        let rightArray = mergeSort(Array(input[splitIndex..<input.count]))
        
        return merge(leftPart: leftArray, rightPart: rightArray)
    }
    
    
    func merge(leftPart: [Int], rightPart: [Int]) -> [Int] {
        var sorted = [Int]()
        
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftPart.count && rightIndex < rightPart.count {
            if leftPart[leftIndex] < rightPart[rightIndex] {
                sorted.append(leftPart[leftIndex])
                leftIndex += 1
            } else if leftPart[leftIndex] > rightPart[rightIndex] {
                sorted.append(rightPart[rightIndex])
                rightIndex += 1
            } else {
                sorted.append(leftPart[leftIndex])
                leftIndex += 1
                sorted.append(rightPart[rightIndex])
                rightIndex += 1
            }
        }
        
        if leftIndex < leftPart.count {
            sorted.append(contentsOf: leftPart[leftIndex..<leftPart.count])
        } else if rightIndex < rightPart.count {
            sorted.append(contentsOf: rightPart[rightIndex..<rightPart.count])
        }
        
        return sorted
    }
}

