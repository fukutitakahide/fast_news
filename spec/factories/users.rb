FactoryBot.define do

  factory :user do
    name              {"tarou"}
    password              {"1234"}
    like_area_id          {"1"}
    like_life_id          {"1"}
    like_science_id       {"1"}
    like_it_id            {"1"}
    like_sports_id        {"1"}
    like_entertainment_id {"1"}
    like_economy_id       {"1"}
  end
end