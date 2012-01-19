module GitHelper
  def list_user_repos(user="jhjguxin", options={})
    skip_fork = options[:skip_fork] || false
    sort_by = options[:sort_by] || "created_at"
    github = Github.new
    repos=github.repos.list_repos :user => user

    if skip_fork
      repos.each do |r|
        #repos.delete(r) if r.fork==true
        #breakpoint
        unless r.fork==true
          repos.delete(r)
        end
      end

    else
      repos
    end
  end
end
