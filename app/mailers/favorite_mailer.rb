class FavoriteMailer < ApplicationMailer
  default from: 'ted@teddit.com'

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@secret-ridge-83487>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-ridge-83487>"
    headers["References"] = "<post/#{post.id}@secret-ridge-83487>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
   end

   def new_post(post)
     headers["Message-ID"] = "<posts/#{post.id}@secret-ridge-83487>"
     headers["In-Reply-To"] = "<post/#{post.id}@secret-ridge-83487>"
     headers["References"] = "<post/#{post.id}@secret-ridge-83487>"

     @post = post

     mail(to: post.user.email, subject: "You're following, #{post.title}!")
   end
end
