//
//  OTPVC.swift
//  spine
//
//  Created by OM Apple on 02/05/22.
//

import SwiftUI
import SVPinView

struct OTPVC: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showLoader: Bool = false
    @State var code = ""
    //    @Binding var ID : String
    @State private var isValidated: Bool   = false
    @State var isSignup : Int? = 0
    @State private var selection : Int? = 0
    
    //Alert Parameters
    @State private var sessionExpire: Int? = 0
    @State var shouldShowAlert = false
    @State var message = "OTP sent success fully on your email address"
    @State var closure : AlertAction?
    @State var isSuccess = true
    var userID : String = ""
    var verificationCode : String = ""
    
    var viewModel : LoginViewModel? = LoginViewModel()
    
    var btnBack: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("ic_back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    }
    
    var body: some View {
        
        ZStack(alignment: .center) {
            let mobileNo = "213132132113"
            VStack() {
                VStack {
                    Text(K.appText.otpSent)
                        .font(AppUtility.shared.appFont(type: .regular, size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.init(white: 0.93))
                        .padding()
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    HStack {
                        OTPWithKAPin(numberofElement: 4) { currentCode in
                            print("currentCode =====> \(currentCode)")
                            print(userID)
                        } didFinishCallback: { OTPNumber in
                            if verificationCode == OTPNumber {
                                self.verifyOTP(OTPNumber)
                            } else {
                                ShowToast.show(toatMessage: "Please enter correct OTP.")
                            }
                        }
                        
                    }
                    .frame(height: 40)
                    .padding()
                    
                    Text(K.appText.haveReceive)
                        .padding(.top, 40)
                        .font(AppUtility.shared.appFont(type: .SemiBold, size: 12))
                        .foregroundColor(Color.init(white: 0.93))
                    
                    //                    NavigationLink(destination: ChangePasswordVC(strTitle: K.appHeaderTitle.resetPassword, isFromLogin: true, mobileNo: mobileNo), tag: 1, selection: self.$selection) {
                    //                        EmptyView()
                    //                    }
                    
                    NavigationLink(destination: MobileNoVC(userID:userID), tag: 1, selection: self.$selection) {
                        EmptyView()
                    }
                    HStack {
                        Button {
                            self.sendOTPAgainonEmail(mobileNo)
                        } label: {
                            Text(K.appButtonTitle.getCodeagain)
                                .font(AppUtility.shared.appFont(type: .regular, size: 16))
                                .underline()
                                .foregroundColor(Color.init(white: 0.93))
                        }
                        .frame(height: 30)
                        Divider().frame(width: 1, height: 20, alignment: .center).background(Color.white)
                        Button {
                            self.sendOTPSMSAgain(mobileNo)
                        } label: {
                            Text(K.appButtonTitle.getCodeaSMS)
                                .font(AppUtility.shared.appFont(type: .regular, size: 16))
                                .underline()
                            
                                .foregroundColor(Color.init(white: 0.93))
                        }
                    }
                }
                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            if shouldShowAlert {
                AlertView(shown: $shouldShowAlert, closureA: $closure, isSuccess: self.isSuccess, message: self.message, buttonTitle: K.appButtonTitle.ok, isShowButton: true, isShowCancel: false).buttonAction {
                    shouldShowAlert = false
                }
            }
            //Navigate To Login Session Expire
            NavigationLink(destination:  TabBarView(), tag: 2, selection: self.$sessionExpire) {
                EmptyView()
            }
            
            IndicatorView(isAnimating: $showLoader)
        }
        .background(
            Image("ic_background")
                .resizable()
                .scaleEffect()
                .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle("OTP Verification")
        .navigationBarItems(leading: btnBack)
        .navigationBarBackButtonHidden(true)
        .accentColor(.white)
    }
    
    func sendOTPAgainonEmail(_ mobileNo : String) {
        self.hideKeyboard()
        self.showLoader = true
        ///api call to send OTP on Mobile number via Email
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.showLoader = false
            self.shouldShowAlert = true
        }
    }
    
    func sendOTPSMSAgain(_ mobileNo : String) {
        self.hideKeyboard()
        selection = 1
       
    }
    
    func verifyOTP(_ otpNumber : String) {
        print(otpNumber)
        self.hideKeyboard()
        viewModel?.verifyOTP(userID: userID){ (response, status) in
            if response?.status == true {
                if let message  = response?.message{
                   ShowToast.show(toatMessage: message)
                    self.selection = 2
                    AppUtility.shared.redirectToMainScreen()
                   
                }
            }else{
               if let message  = response?.message{
                   ShowToast.show(toatMessage: message)
                }
            }
        }
    }
}

struct OTPVC_Previews: PreviewProvider {
    static var previews: some View {
        OTPVC()
    }
}


struct OTPWithKAPin: UIViewRepresentable {
    var otpCode: String?
    var numberofElement: Int = 4
    var didChangeCallback : (_ code: String) -> ()
    var didFinishCallback : (_ code: String) -> ()
    
    class Coordinator: NSObject {
        var parent: OTPWithKAPin
        
        init(_ parent: OTPWithKAPin) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) ->  SVPinView {
        let pinView:SVPinView = SVPinView()
        
        pinView.pinLength = numberofElement
        //        pinView.secureCharacter = "\u{25CF}"
        pinView.interSpace = CGFloat(20)
        pinView.textColor = UIColor.white
        pinView.shouldSecureText = false
        pinView.style = .underline
        
        pinView.borderLineColor = UIColor.white
        pinView.activeBorderLineColor = UIColor.white
        pinView.borderLineThickness = 1
        pinView.activeBorderLineThickness = 2
        
       // pinView.font = UIFont(fontStyle: AppUtility.shared.appFont(type: .regular, size: 20)) ?? UIFont.systemFont(ofSize: 20)
       
        pinView.keyboardType = .phonePad
        pinView.keyboardAppearance = .default
        //        pinView.placeholder = "******"
        pinView.isContentTypeOneTimeCode = true
        pinView.updateFocusIfNeeded()
        pinView.becomeFirstResponderAtIndex = 0
        
        pinView.didFinishCallback = {  pin in
            //            AppUtility.shared.printToConsole("The pin entered is \(pin)")
            self.didFinishCallback(pin)
        }
        
        pinView.didChangeCallback = { pin in
            self.didChangeCallback(pin)
        }
        
        return pinView
    }
    
    func updateUIView(_ uiView: SVPinView, context: Context) {
        
    }
}
