//
//  CommentSectionView.swift
//  spine
//
//  Created by Mac on 23/06/22.
//

import SwiftUI

struct CommentSectionView: View {
    @State var commentText = ""
    let replyCount = 2
    @State var comments = [comment1, comment2]
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                EventPreviewText(text: "COMMENTS", fSize: 14, fontWeight: .regular)
                CustomTextFieldDynamic(searchText: $commentText, placeHolder: "Add a public comment")
                    .onSubmit {
                        print("enter tapped")
                        if commentText.count > 1 {
                            let newComment = Comment(name: "Test", comment: commentText, replies: [], liked: false)
                            comments.append(newComment)
                            commentText = ""
                        }
                    }
            }
            VStack {
                ForEach($comments, id: \.self) { $comment in
                    CommentPersonView(comment: comment)
                }
            }
        }.padding(.horizontal, 20)
        
    }
}

struct CommentSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CommentSectionView()
    }
}

struct CommentPersonView: View {
    let comment: Comment
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            CircularBorderedProfileView(image: comment.image, size: 44, borderWidth: 0, showShadow: false)
            VStack(alignment: .leading, spacing: 5) {
                Text(comment.name)
                    .font(.custom("Avenir", size: 14)).fontWeight(.medium)
                Text(comment.comment)
                    .font(.custom("Avenir", size: 14))
                    .foregroundColor(.lightBlackText)
                HStack(spacing: 20) {
                    Button { } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.lightGray1)
                    }
                    ButtonComment(title: "Reply") {
                        
                    }
                    
                    if getReplyCount() != "" {
                        ButtonComment(title: getReplyCount()) {
                        }
                    }
                    Spacer()
                    Text("1d")
                        .font(.custom("Avenir", size: 14))
                        .foregroundColor(.lightGray1)
                }
                if !comment.replies.isEmpty {
                    ForEach(comment.replies, id: \.self) { sudComment in
                        CommentPersonView(comment: sudComment)
                    }
                }
            }
            
        }.padding(.vertical, 10)
    }
    
    func getReplyCount()-> String{
        let count = comment.replies.count
        switch count {
        case 0:
            return ""
        case 1:
            return "1 reply"
        default:
            return "\(count) replies"
        }
    }
}


struct ButtonComment: View {
    let title: String
    var onTapped: ()-> Void
    var body: some View {
        Button(title){
            onTapped()
        }.foregroundColor(.lightBrown)
            .font(.custom("Avenir", size: 14))
    }
}
