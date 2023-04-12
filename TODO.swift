//
//  TODO.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//



/*
 MARK: TO_DO
 
 - Activities and days List width need correction( make wider)
 - Add ask user permission to access to photo library
 */


/*
 MARK: Remarks
 - @Enviroment работает только для child view
 - Image.clipped - обрезает только видмую часть картинки при этом сохраняет оригинальный размер картинки, что при использовании в верхнем слое ZStack, может сделать недоступным нижние view, потому что картинка будет накрывать их
 - List view works only with @Published objects to automatically update data
 - Absence of cool features that presented in UIKit. To use features of UIKit need to create separate view with coordinator class
 - Picker doesn't work with optional values. safe unwrap values before use in Picker
 - There is no inbox implementation in List to move row between sections, drag and drop also. Only between views. if needed sections Use another type of view instead of Section()
 */


/*
 MARK: Crutches(Костыли)
 - For online updating data in List view was created @Published property in TripsData. Property is a copy of static property.
 */
