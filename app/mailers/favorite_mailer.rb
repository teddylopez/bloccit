class FavoriteMailer < ApplicationMailer
  default from: 'tedmlopez@gmail.com'

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@mysterious-reaches-20384>"
    headers["In-Reply-To"] = "<post/#{post.id}@mysterious-reaches-20384>"
    headers["References"] = "<post/#{post.id}@mysterious-reaches-20384>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
   end

   def new_post(post)
     headers["Message-ID"] = "<posts/#{post.id}@mysterious-reaches-20384>"
     headers["In-Reply-To"] = "<post/#{post.id}@mysterious-reaches-20384>"
     headers["References"] = "<post/#{post.id}@mysterious-reaches-20384>"

     @post = post

     mail(to: post.user.email, subject: "You're following, #{post.title}!")
   end
end
