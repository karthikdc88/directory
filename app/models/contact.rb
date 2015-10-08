class Contact < ActiveRecord::Base
    
    validates_presence_of :name, :age, :mobile_no, :email, :occupation
    validates_numericality_of :mobile_no
    validates_uniqueness_of :email ,:mobile_no
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_length_of :mobile_no, is: 10
    
end
