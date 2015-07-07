module DashboardsHelper

  def cache_key_for_topstories
    count          = Topstories.count
    max_updated_at = Topstories.maximum(:updated_at).try(:utc).try(:to_s, :number)
  end

end
