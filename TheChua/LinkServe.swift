//
//  LinkServe.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/3/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class LinkServe {
    private let Domain:String = "http://thechua.vn/"
    private let DomainApi:String
    //API ko can token
    var LinkShare:String
    var InviteWeb:String
    var UrlCheckUser:String
    var GetEventShare:String
    var UrlTracking:String
    //API can token
    var RRS:String
    var GetRRSOffers:String
    var PushDeviceToken:String
    var UrlGetOffers:String
    var UrlgetUserId:String
    var UrlGetPoint:String
    var UrlRedeem:String
    var UrlLichsudoiqua:String
    var UrlLichsunhanxu:String
    var UrlGetEvents:String
    var UrlGetCards:String
    var UrlInvite:String
    var InstantLead:String
    var CheckStatus:String
    var Privacy:String
    var Contact:String
    
    
    init() {
        DomainApi = "\(Domain)api/"
        //Ko check Token
        self.GetEventShare = DomainApi + "geteventshare"
        
        //Link share
        self.LinkShare = Domain + "download?i="
        self.InviteWeb = Domain + "in?uid="
        //Check Token
        //RRS
        self.GetRRSOffers = DomainApi + "getRrsOffers?token="
        self.RRS = DomainApi + "rrs"
        
        self.CheckStatus = DomainApi + "checkstatus" //
        self.UrlGetOffers = DomainApi + "getOffers" //
        self.UrlCheckUser = DomainApi + "checkUser" //
        self.UrlgetUserId = DomainApi + "getInfoUser?token=" //+ token
        self.UrlTracking = DomainApi + "tracking"
        self.UrlGetPoint = DomainApi + "getPoint?token="
        self.UrlRedeem = DomainApi + "redeem"
        self.UrlLichsudoiqua = DomainApi + "historyredeem?token=" //
        self.UrlLichsunhanxu = DomainApi + "historynhanxu?token=" //
        self.UrlGetEvents = DomainApi + "getEvents?token="
        self.UrlGetCards = DomainApi + "getCards?token="
        self.UrlInvite = DomainApi + "invite?token="
        self.InstantLead = DomainApi + "instantLead"
        self.PushDeviceToken = DomainApi + "pushdevicetoken"
        self.Privacy = Domain + "privacy"
        self.Contact = Domain + "contact"
        
        
    }
}