class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  private
  def author?
    return false unless user
    record.author_id == user.id
  end

end
