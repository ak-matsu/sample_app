require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user=User.new(name:"Example User",email:"user@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  # 存在性の確認
  # nameを空白にする
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
  
  # emailを空白である
  test "email should be present" do
    @user.email = " "
    assert_not@user.valid?
  end
  
  # nameにaを51文字入力する
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailにaを244文字入力する
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  # 有効なメールフォーマット
    test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  # 無効なメールフォーマット
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  # 重複したメールアドレスを作成
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
