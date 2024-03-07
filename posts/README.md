# Using renv per post

https://www.joelnitta.com/posts/2024-01-11_using_renv_with_blog/

1. Create blog post, e.g., ./posts/2023-09-29_my_post/index.qmd
2. Open that post folder in its own instance of VScode or RStudio (so that your wd is ./posts/2023-09-29_my_post/ )
3. Write post.
4. Run renv::snapshot(). This will write ./posts/2023-09-29_my_post/renv.lock , but will not modify .Rprofile or create a project library.
5. Include the line renv::use(lockfile = "renv.lock") in the setup chunk of your post (or a chunk at the very top with #| include: false)
6. Go back to your main website project and run quarto render or quarto preview to knit the post. Your post will use the package versions stored in the lockfile for that post.
