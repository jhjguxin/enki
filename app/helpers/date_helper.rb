module DateHelper
  def format_month(date)
    date.strftime(I18n.t "time.formats.short")
  end

  def format_post_date(date)
    #date.strftime("%B %d, %Y")
    date.strftime(I18n.t("date.formats.long"))
  end

  def format_comment_date(date)
    "at " + date.strftime(I18n.t "time.formats.long")
  end
end
