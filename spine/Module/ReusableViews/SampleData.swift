//
//  SampleData.swift
//  spine
//
//  Created by Mac on 22/06/22.
//

import Foundation

struct EventDetail: Hashable {
    let isBanner: Bool
    var bannerImg: String = ""
    let eventType: EventType
    let title: String
    let location: String
    let time: String
    let days: String
    let cost: String
    let hostName: String
    let link: String
    let invitation: Invitation
    let date: String
}

let event1 = EventDetail(isBanner: false, eventType: .retreat, title: "Yoga Weekend - Reclaiming Your Centre", location: "Madrid, Spain", time: "", days: "2 days", cost: "$75", hostName: "Oliver", link: "", invitation: .none, date: "")
let event2 = EventDetail(isBanner: false, eventType: .online, title: "Lorem Ipsum dolor sit amet", location: "", time: "18.00-19.00", days: "", cost: "FREE", hostName: "Anna", link: "Link:www.abc.com", invitation: .none, date: "")
let event3 = EventDetail(isBanner: false, eventType: .retreat, title: "Lorem Ipsum dolor sit amet Lorem Ipsum dolor", location: "London, UK", time: "", days: "2 days", cost: "$70", hostName: "Tom", link: "", invitation: .none, date: "")
let event4 = EventDetail(isBanner: true, bannerImg: "magic-bowls",  eventType: .online, title: "", location: "", time: "", days: "", cost: "", hostName: "", link: "", invitation: .none, date: "")


let event5 = EventDetail(isBanner: false, eventType: .online, title: "Sahaja yoga online meditation centre", location: "", time: "18.00-19.00", days: "", cost: "FREE", hostName: "Chris", link: "Link:www.abc2.com", invitation: .notAccepted, date: "")
let event6 = EventDetail(isBanner: false, eventType: .online, title: "Sahaja yoga online meditation centre", location: "", time: "18.00-19.00", days: "", cost: "FREE", hostName: "Chris", link: "Link:www.abc2.com", invitation: .pending, date: "")
let event7 = EventDetail(isBanner: false, eventType: .online, title: "Lorem Ipsum dolor sit amet", location: "", time: "18.00-19.00", days: "", cost: "FREE", hostName: "Anna", link: "Link:www.abc.com", invitation: .accepted, date: "")

// comment model

struct Comment: Hashable {
    let id = UUID()
    let name: String
    var image: String = "Oval 5"
    let comment: String
    let replies: [Comment]
    var liked: Bool
}

let comment1 = Comment(name: "Anna", comment: "Lorem ipsum sit amet, set consecuter discipline ipsum sit amet", replies: [Comment(name: "Stephen1", comment: "Test message1", replies: [], liked: false), Comment(name: "Stephen2", comment: "Test messahe 2", replies: [], liked: false)], liked: false)
let comment2 = Comment(name: "Oliver", comment: "Lorem ipsum sit amet, set consecuter discipline ipsum sit amet2", replies: [Comment(name: "Mark", comment: "Test message 2", replies: [], liked: false)], liked: true)


struct Attendee: Hashable {
    let name: String
    var img: String
    var msgEn: Bool
}

let attendeeLst = [Attendee(name: "Craig Warner", img: "Oval 57", msgEn: true), Attendee(name: "Edvin D.", img: "Oval 5", msgEn: false), Attendee(name: "Brendon Lewis", img: "Oval 57", msgEn: true), Attendee(name: "Harriet", img: "Oval 5", msgEn: false), Attendee(name: "Ralph", img: "Oval 57", msgEn: false), Attendee(name: "Estella", img: "Oval 5", msgEn: true), Attendee(name: "Mark Lenin", img: "Oval 57", msgEn: false), Attendee(name: "Edvin Det", img: "Oval 5", msgEn: false), Attendee(name: "David Warner", img: "Oval 57", msgEn: false), Attendee(name: "Steve smith", img: "Oval 5", msgEn: false), Attendee(name: "Shane watson", img: "Oval 57", msgEn: true), Attendee(name: "david Hussey", img: "Oval 5", msgEn: false) ]
