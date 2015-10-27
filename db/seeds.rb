text = "Lorem ipsum dolor sit amet, aut potenti nunc viverra fermentum quis non, nulla a nisl nisl metus tortor, et lacinia vel sem libero. Ut luctus egestas, amet nec tortor. Ipsum ut rutrum felis rutrum pretium malesuada, pede ac et sociis, morbi justo lectus donec purus, fermentum nunc nec quis."

user = User.create(first_name: "John", 
                   last_name: "Doe", 
                   email: "john.doe@email.com", 
                   text: text)

Style.create(user_id: user.id)