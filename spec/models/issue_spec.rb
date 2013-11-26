# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :text
#  resolved    :integer          default(0)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  anonymous   :boolean          default(FALSE)
#

require 'spec_helper'

describe Issue do
  pending "add some examples to (or delete) #{__FILE__}"
end
