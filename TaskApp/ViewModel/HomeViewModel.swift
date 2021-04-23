//
//  HomeView.swift
//  TaskApp
//
//  Created by Илья Подлесный on 23.04.2021.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    //MARK - PREFERENCES
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
    //MARK - CHEKING AND UPDATING DATA
    
    //MARK - STORING UPDATE ITEM
    @Published var updateItem : Task!
    
    let calender = Calendar.current
    func checkDate()->String{
        
        if calender.isDateInToday(date){
            
            return "Today"
        }
        else if calender.isDateInTomorrow(date){
            
            return "Tomorrow"
        }
        else {
            
            return "Other day"
        }
    }
    
    func updateDate(value: String){
        
        if value == "Today" {date = Date()}
        else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else {
            
            
        }
    }
    
    func writeData(context : NSManagedObjectContext){
        //MARK - UPDATING ITEM
        
        if updateItem != nil {
            
            //MARK - MEANS UPDATE OLD DATA
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            //MARK - REMOVING UPDATION ITEMS IF SUCCESSFULL
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        //MARK - SAVING DATA
        
        do {
            
            try context.save()
            //MARK - SUCCESS MEANS CLOSING VIEW
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item: Task){
        
        updateItem = item
        //MARK - TOGGING THE NEWDATAVIEW
        
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
