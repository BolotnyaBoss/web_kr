class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    admin? || author?
  end

  def destroy?
    admin? || author?
  end

  private
  def author?
    return false unless user
    record.author_id == user.id
  end

end
