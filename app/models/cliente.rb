class Cliente < ActiveRecord::Base

  has_many :estabelecimentos

  def self.search(search)
    if search
      find(:all, :conditions => ['nome_fantasia LIKE ?  OR razao_social LIKE ? OR nome_responsavel LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end

