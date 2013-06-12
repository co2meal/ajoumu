ActiveAdmin.register Music do
  member_action :approve, :method => :put do
    music = Music.find(params[:id])
    music.approved_at = Time.now
    music.save!

    redirect_to({:action => :show}, {:notice => "Approved!" })
  end

  action_item :only => :show do
    link_to "Approve", {:action => 'approve'}, :method => "put"
  end
end
