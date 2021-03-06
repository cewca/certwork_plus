# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(firstname: "John",lastname: "Wick",username: "candidate1",password: "Ab1234",password_confirmation: "Ab1234", email: "candidate1@demo.com")
user2 = User.create!(firstname: "Roy",lastname: "Wells",username: "candidate2",password: "Ab1234",password_confirmation: "Ab1234", email: "candidate2@demo.com")
user3 = User.create!(firstname: "Katherine",lastname: "Fujii",username: "candidate3",password: "Ab1234",password_confirmation: "Ab1234", email: "candidate3@demo.com")
user4 = User.create!(firstname: "Norri",lastname: "Noah",username: "candidate4",password: "Ab1234",password_confirmation: "Ab1234", email: "candidate4@demo.com")
user5 = User.create!(firstname: "Viola",lastname: "Tomas",username: "candidate5",password: "Ab1234",password_confirmation: "Ab1234", email: "candidate5@demo.com")
assesser1 = User.create!(firstname: "Earl E.",lastname: "McBride",username: "assesser1", password: "Ab1234", password_confirmation: "Ab1234",email: "assesser1@demo.com")
assesser2 = User.create!(firstname: "Daniel",lastname: "Beegle",username: "assesser2", password: "Ab1234", password_confirmation: "Ab1234", email: "assesser2@demo.com")

plan1= AssessmentPlan.create!(candidate: user1, assigned_by: assesser1)
Message.create!(from: assesser1, to: user1, subject: "Welcome to Certwork+program")
AssessmentIndicator.create!(name: "Standard 1.1.1 Guide team daily operations", assessment_plan: plan1)
AssessmentIndicator.create!(name: "Standard 1.1.2 Oversea/provision product process", assessment_plan: plan1)
AssessmentIndicator.create!(name: "Standard 1.2.1 Indentify project issues", assessment_plan: plan1)
AssessmentIndicator.create!(name: "Standard 1.2.2 Take training of project management",  assessment_plan: plan1)
AssessmentIndicator.create!(name: "Standard 1.2.3 Train other team memebers", assessment_plan: plan1)
AssessmentIndicator.create!(name: "Stardard 1.2.4 Cooridinate with mechanical engineers", assessment_plan: plan1)

plan2= AssessmentPlan.create!(candidate: user2, assigned_by: assesser1)
#Message.create(from: assesser1, to: user2, subject: "Welcome to Certwork+program")
AssessmentIndicator.create!(name: "Standard 1.1.1 Guide team daily operations", assessment_plan: plan2)
AssessmentIndicator.create!(name: "Standard 1.1.2 Oversea/provision product process",  assessment_plan: plan2)
AssessmentIndicator.create!(name: "Standard 1.2.1 Indentify project issues",  assessment_plan: plan2)
AssessmentIndicator.create!(name: "Standard 1.2.2 Take training of project management", assessment_plan: plan2)
AssessmentIndicator.create!(name: "Standard 1.2.3 Train other team memebers",  assessment_plan: plan2)
AssessmentIndicator.create!(name: "Stardard 1.2.4 Cooridinate with mechanical engineers",  assessment_plan: plan2)

plan3= AssessmentPlan.create(candidate: user3, assigned_by: assesser1)
#Message.create!(from: assesser1, to: user3, subject: "Welcome to Certwork+program")
AssessmentIndicator.create!(name: "Standard 1.1.1 Guide team daily operations",  assessment_plan: plan3)
AssessmentIndicator.create!(name: "Standard 1.1.2 Oversea/provision product process",  assessment_plan: plan3)
AssessmentIndicator.create!(name: "Standard 1.2.1 Indentify project issues",  assessment_plan: plan3)
AssessmentIndicator.create!(name: "Standard 1.2.2 Take training of project management",  assessment_plan: plan3)
AssessmentIndicator.create!(name: "Standard 1.2.3 Train other team memebers",  assessment_plan: plan3)
AssessmentIndicator.create!(name: "Stardard 1.2.4 Cooridinate with mechanical engineers",  assessment_plan: plan3)

plan4= AssessmentPlan.create!(candidate: user4, assigned_by: assesser2)
#Message.create(from: assesser2, to: user4, subject: "Welcome to Certwork+program")
AssessmentIndicator.create!(name: "Standard 1.1.1 Guide team daily operations",  assessment_plan: plan4)
AssessmentIndicator.create!(name: "Standard 1.1.2 Oversea/provision product process",  assessment_plan: plan4)
AssessmentIndicator.create!(name: "Standard 1.2.1 Indentify project issues",  assessment_plan: plan4)
AssessmentIndicator.create!(name: "Standard 1.2.2 Take training of project management",  assessment_plan: plan4)
AssessmentIndicator.create!(name: "Standard 1.2.3 Train other team memebers",  assessment_plan: plan4)
AssessmentIndicator.create!(name: "Stardard 1.2.4 Cooridinate with mechanical engineers",  assessment_plan: plan4)

plan5= AssessmentPlan.create(candidate: user5, assigned_by: assesser2)
#Message.create(from: assesser2, to: user5, subject: "Welcome to Certwork+program")
AssessmentIndicator.create!(name: "Standard 1.1.1 Guide team daily operations", assessment_plan: plan5)
AssessmentIndicator.create!(name: "Standard 1.1.2 Oversea/provision product process", assessment_plan: plan5)
AssessmentIndicator.create!(name: "Standard 1.2.1 Indentify project issues",  assessment_plan: plan5)
AssessmentIndicator.create!(name: "Standard 1.2.2 Take training of project management",  assessment_plan: plan5)
AssessmentIndicator.create!(name: "Standard 1.2.3 Train other team memebers", assessment_plan: plan5)
AssessmentIndicator.create!(name: "Stardard 1.2.4 Cooridinate with mechanical engineers",  assessment_plan: plan5)
