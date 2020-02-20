class Product < ApplicationRecord

	has_many :cart_lines, dependent: :destroy
  has_many :carts, :through => :cart_lines

	validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true


  scope :filter_by_name, lambda { |keyword| where('lower(name) LIKE ?', "%#{keyword.downcase}%") }
  scope :above_or_equal, lambda { |price| where('price >= ?', price) }
  scope :below_or_equal, lambda { |price| where('price <= ?', price) }

  def self.search_paginated(per_page, page, sort)
    Product.all.limit(per_page).offset(page).order(sort)
  end

  def self.search_by_prices(min, max)
    products = min.present? ? Product.above_or_equal(min) : Product.all
    products = min.present? ? products.below_or_equal(max) : products
    products
  end

  def self.search_by_name(name, min, max, sort)
    products = Product.filter_by_name(name)
    products.search_by_prices(min,max).order(:sort)
  end

end
