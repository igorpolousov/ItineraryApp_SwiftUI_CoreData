//
//  TODO.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//



/*
 MARK: TO_DO
 
 - how to remove alert in "ViewTransitionExtension"? -> option 1: change .overCurrentContext to ZStack and add if statement with boolean var, if == true add in Ztack AddTrip or other popUp.
 - add alert if trying to create  day or action without name
 - add days List view to Activities view. (Days -> Sections, Activities -> rows)
 - add Day functions
 - add Activity functions
 
 
 */


/*
 MARK: Remarks
 - @Enviroment работает только для child view
 - Image.clipped - обрезает только видмую часть картинки при этом сохраняет оригинальный размер картинки, что при использовании в верхнем слое ZStack, может сделать недоступным нижние view, потому что картинка будет накрывать их
 - List view works only with @Published objects to automatically update data
 - Absence of cool features that presented in UIKit. To use features of UIKit need to create separate view with coordinator class
 */


/*
 MARK: Crutches(Костыли)
 - For online updating data in List view was created @Published property in TripsData. Property is a copy of static property.
 */
