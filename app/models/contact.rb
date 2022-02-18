class Contact < ApplicationRecord

    #Associations
    belongs_to :kind #, optional: true
    has_many :phones

    accepts_nested_attributes_for :phones

    def as_json(options={})
        hash = super(options)
        hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        hash
    end

    # def birthdate_br
    #     I18n.l(self.birthdate) unless self.birthdate.blank?
    # end

    # def to_br
    #     {
    #         name: self.name,
    #         email: self.email,
    #         birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    #     }
    # end

    # def author
    #     "Jackson Pires"
    # end

    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: [:kind_description, :author],
    #         include: { kind: { only: :description }}
    #     )
    # end

    # def hello
    #     I18n.t('hello')
    # end

    # def i18n
    #     I18n.default_locale
    # end
end
