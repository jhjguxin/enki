module GitHelper
  def list_user_repos(user="jhjguxin", options={})
    skip_fork = options[:skip_fork] || false
    sort_by = options[:sort_by] || "created_at"

    #breakpoint
    if enki_config[:show_git_repos]==false
      return repos=[]
    end
    github = Github.new
    begin 
      repos=github.repos.list_repos :user => user
    #rescue   errorType1             #要捕捉的异常类型
    #......                                #处理异常的代码 
    rescue => err   
      puts err
      return repos=[]
    ensure #这里的代码在总是被执行，可以做一些清理工作
      puts "process finished ..."
    end
    if skip_fork
      repos.each do |r|
        repos.delete(r) if r.fork==true
        #breakpoint
      end

    else
      repos
    end
  end
end
