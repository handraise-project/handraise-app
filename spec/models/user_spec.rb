# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permissions    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  uid            :string(255)
#  github_name    :string(255)
#  provider       :string(255)
#  email          :string(255)
#  image_gravatar :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
