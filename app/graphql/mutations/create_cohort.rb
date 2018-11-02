module Mutations
  class CreateCohort < Mutations::BaseMutation
    argument :input, Types::CohortInput, required: true

    field :cohort, Types::Cohort, null: true
    field :errors, [String], null: false

    def resolve(input:)
      cohort = Cohort.new(input.to_h)
      if cohort.save
        {
          cohort: cohort,
          errors: []
        }
      else
        {
          cohort: nil,
          errors: cohort.errors.full_messages
        }
      end
    end
  end
end
